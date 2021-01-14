import 'package:flutter_todo/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddTodoListAction>(_onAddTodoList),
  TypedReducer<AppState, DeleteTodoListAction>(_onDeleteTodoList),
]);

AppState _onAddTodoList(AppState state, AddTodoListAction action) => state.copyWith(
      todoLists: List.from(state.todoLists)..add(action.todoList),
    );

AppState _onDeleteTodoList(AppState state, DeleteTodoListAction action) => state.copyWith(
      todoLists: List.from(state.todoLists)..remove(action.todoList),
    );
