import 'package:flutter_test/flutter_test.dart';
import 'package:amazing_lists/model/todo.dart';
import 'package:amazing_lists/model/todo_list.dart';

void main() {
  test(
      'GIVEN a todo list'
      'WHEN #addTodo is called '
      'THEN it returns a copy with the added todo ', () {
    final oldTodoList = TodoList(id: '1', name: 'Groceries', todos: []);
    final expectedTodoList = TodoList(
      id: '1',
      name: 'Groceries',
      todos: [Todo(id: '1', name: 'Apples')],
    );

    final actualTodoList = oldTodoList.addTodo(Todo(id: '1', name: 'Apples'));

    expect(actualTodoList, expectedTodoList);
    // Change is non-mutating
    expect(actualTodoList, isNot(equals(oldTodoList)));
  });
}
