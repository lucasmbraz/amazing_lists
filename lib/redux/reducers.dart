import 'package:flutter_todo/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddTodoListAction>(_onAddTodoList),
]);

AppState _onAddTodoList(AppState state, AddTodoListAction action) {
  return state.copyWith(
    todoLists: List.from(state.todoLists)..add(action.todoList),
  );
}
