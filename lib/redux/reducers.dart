import 'package:amazing_lists/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddProjectAction>(_onAddProject),
  TypedReducer<AppState, DeleteProjectAction>(_onDeleteProject),
  TypedReducer<AppState, AddTaskAction>(_onAddTask),
  TypedReducer<AppState, ToggleTaskCompleteAction>(_onToggleTaskComplete),
]);

AppState _onAddProject(AppState state, AddProjectAction action) => state.copyWith(
      projects: [...state.projects]..add(action.project),
    );

AppState _onDeleteProject(AppState state, DeleteProjectAction action) => state.copyWith(
      projects: [...state.projects]..remove(action.project),
    );

AppState _onAddTask(AppState state, AddTaskAction action) {
  final projects = [...state.projects];
  final project = projects.firstWhere((p) => p.id == action.projectId);
  final index = projects.indexOf(project);
  projects.removeAt(index);

  final updatedProject = project.addTodo(action.task);
  projects.insert(index, updatedProject);

  return state.copyWith(
    projects: projects,
  );
}

AppState _onToggleTaskComplete(AppState state, ToggleTaskCompleteAction action) {
  final projects = [...state.projects];
  final project = projects.firstWhere((p) => p.id == action.projectId);
  final projectIndex = projects.indexOf(project);

  final tasks = [...project.tasks];
  final task = tasks.firstWhere((t) => t.id == action.taskId);
  final newTask = task.copyWith(complete: !task.complete);

  final taskIndex = tasks.indexOf(task);
  tasks
    ..removeAt(taskIndex)
    ..insert(taskIndex, newTask);

  final newProject = project.copyWith(tasks: tasks);
  projects
    ..removeAt(projectIndex)
    ..insert(projectIndex, newProject);

  return state.copyWith(
    projects: projects,
  );
}
