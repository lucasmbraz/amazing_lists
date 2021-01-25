import 'package:flutter_todo/model/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list.freezed.dart';

@freezed
abstract class TodoList implements _$TodoList {
  const TodoList._();

  const factory TodoList({
    @required String id,
    @required String name,
    @required List<Todo> todos,
  }) = _TodoList;

  TodoList addTodo(Todo todo) {
    return copyWith(
      todos: List.from(todos)..add(todo),
    );
  }
}
