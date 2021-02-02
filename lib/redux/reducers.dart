import 'package:amazing_lists/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddProjectAction>(_onAddProject),
  TypedReducer<AppState, DeleteProjectAction>(_onDeleteProject),
  TypedReducer<AppState, AddTaskAction>(_onAddTask),
]);

AppState _onAddProject(AppState state, AddProjectAction action) => state.copyWith(
      projects: [...state.projects]..add(action.project),
    );

AppState _onDeleteProject(AppState state, DeleteProjectAction action) => state.copyWith(
      projects: [...state.projects]..remove(action.project),
    );

AppState _onAddTask(AppState state, AddTaskAction action) {
  final projects = [...state.projects];
  final index = projects.indexOf(action.project);
  projects.removeAt(index);

  final updatedProject = action.project.addTodo(action.task);
  projects.insert(index, updatedProject);

  return state.copyWith(
    projects: projects,
  );
}
