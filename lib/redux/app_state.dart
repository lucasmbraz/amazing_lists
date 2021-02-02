import 'package:amazing_lists/model/todo.dart';
import 'package:amazing_lists/model/todo_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState implements _$AppState {
  const AppState._();

  const factory AppState({
    @required List<TodoList> todoLists,
  }) = _AppState;

  factory AppState.init() => AppState(
        todoLists: [
          TodoList(id: '1', name: 'List #1', todos: [Todo(id: '1', name: 'Apples'), Todo(id: '2', name: 'Oranges')]),
          TodoList(id: '2', name: 'List #2', todos: []),
          TodoList(id: '3', name: 'List #3', todos: []),
          TodoList(id: '4', name: 'List #4', todos: []),
          TodoList(id: '5', name: 'List #5', todos: []),
          TodoList(id: '6', name: 'List #6', todos: []),
          TodoList(id: '7', name: 'List #7', todos: []),
          TodoList(id: '8', name: 'List #8', todos: []),
          TodoList(id: '9', name: 'List #9', todos: []),
          TodoList(id: '10', name: 'List #10', todos: []),
          TodoList(id: '11', name: 'List #11', todos: []),
          TodoList(id: '12', name: 'List #12', todos: []),
          TodoList(id: '13', name: 'List #13', todos: []),
          TodoList(id: '14', name: 'List #14', todos: []),
          TodoList(id: '15', name: 'List #15', todos: []),
        ],
      );
}
