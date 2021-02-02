import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/model/task.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'GIVEN a todo list'
      'WHEN #addTodo is called '
      'THEN it returns a copy with the added todo ', () {
    final oldTodoList = Project(id: '1', name: 'Groceries', tasks: []);
    final expectedTodoList = Project(
      id: '1',
      name: 'Groceries',
      tasks: [Task(id: '1', name: 'Apples')],
    );

    final actualTodoList = oldTodoList.addTodo(Task(id: '1', name: 'Apples'));

    expect(actualTodoList, expectedTodoList);
    // Change is non-mutating
    expect(actualTodoList, isNot(equals(oldTodoList)));
  });
}
