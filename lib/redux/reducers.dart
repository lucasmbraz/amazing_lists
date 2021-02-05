import 'package:amazing_lists/redux/actions.dart';
import 'package:amazing_lists/utils/extensions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddProjectAction>(_onAddProject),
  TypedReducer<AppState, DeleteProjectAction>(_onDeleteProject),
  TypedReducer<AppState, AddTaskAction>(_onAddTask),
  TypedReducer<AppState, ToggleTaskCompleteAction>(_onToggleTaskComplete),
]);

AppState _onAddProject(AppState state, AddProjectAction action) => state.copyWith(
      projects: state.projects.insertOrUpdate(action.project.id, action.project),
    );

AppState _onDeleteProject(AppState state, DeleteProjectAction action) => state.copyWith(
      projects: {...state.projects}..remove(action.project.id),
    );

AppState _onAddTask(AppState state, AddTaskAction action) => state.copyWith(
      tasks: state.tasks.insertOrUpdate(action.task.id, action.task),
    );

AppState _onToggleTaskComplete(AppState state, ToggleTaskCompleteAction action) {
  final task = state.tasks[action.taskId];
  final updatedTask = task.copyWith(complete: !task.complete);

  return state.copyWith(tasks: state.tasks.insertOrUpdate(updatedTask.id, updatedTask));
}
