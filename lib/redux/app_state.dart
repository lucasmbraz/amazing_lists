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
          TodoList(name: 'List #1'),
          TodoList(name: 'List #2'),
          TodoList(name: 'List #3'),
          TodoList(name: 'List #4'),
          TodoList(name: 'List #5'),
        ],
      );
}
