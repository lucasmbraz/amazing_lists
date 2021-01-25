import 'package:flutter_todo/model/todo_list.dart';
import 'package:flutter_todo/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddTodoListAction>(_onAddTodoList),
  TypedReducer<AppState, DeleteTodoListAction>(_onDeleteTodoList),
  TypedReducer<AppState, AddTodoAction>(_onAddTodo),
]);

AppState _onAddTodoList(AppState state, AddTodoListAction action) => state.copyWith(
      todoLists: List.from(state.todoLists)..add(action.todoList),
    );

AppState _onDeleteTodoList(AppState state, DeleteTodoListAction action) => state.copyWith(
      todoLists: List.from(state.todoLists)..remove(action.todoList),
    );

AppState _onAddTodo(AppState state, AddTodoAction action) {
  final todosList = List<TodoList>.from(state.todoLists);
  final index = todosList.indexOf(action.todoList);
  todosList.removeAt(index);

  final updatedTodoList = action.todoList.addTodo(action.todo);
  todosList.insert(index, updatedTodoList);

  return state.copyWith(
    todoLists: todosList,
  );
}
