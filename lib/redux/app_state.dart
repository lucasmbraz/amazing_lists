import 'package:flutter_todo/model/todo_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @required List<TodoList> todoLists,
  }) = _AppState;

  factory AppState.init() => AppState(
        todoLists: [
          TodoList(id: '1', name: 'List #1'),
          TodoList(id: '2', name: 'List #2'),
          TodoList(id: '3', name: 'List #3'),
          TodoList(id: '4', name: 'List #4'),
          TodoList(id: '5', name: 'List #5'),
        ],
      );
}
