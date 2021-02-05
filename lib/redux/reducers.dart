import 'package:amazing_lists/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddProjectAction>(_onAddProject),
  TypedReducer<AppState, DeleteProjectAction>(_onDeleteProject),
  TypedReducer<AppState, AddTaskAction>(_onAddTask),
  TypedReducer<AppState, ToggleTaskCompleteAction>(_onToggleTaskComplete),
]);

AppState _onAddProject(AppState state, AddProjectAction action) {
  final projects = {...state.projects};
  projects[action.project.id] = action.project;

  return state.copyWith(projects: projects);
}

AppState _onDeleteProject(AppState state, DeleteProjectAction action) => state.copyWith(
      projects: {...state.projects}..remove(action.project.id),
    );

AppState _onAddTask(AppState state, AddTaskAction action) {
  final tasks = {...state.tasks};
  tasks[action.task.id] = action.task;

  return state.copyWith(tasks: tasks);
}

AppState _onToggleTaskComplete(AppState state, ToggleTaskCompleteAction action) {
  final tasks = {...state.tasks};
  final task = tasks[action.taskId];

  final updatedTask = task.copyWith(complete: !task.complete);
  tasks[updatedTask.id] = updatedTask;

  return state.copyWith(tasks: tasks);
}
