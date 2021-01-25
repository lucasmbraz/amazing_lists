import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/todos/todos_widget.dart';

void main() {
  testWidgets(
      'GIVEN a list of todos '
      'WHEN TodosWidget is displayed '
      'THEN it shows all todos', (WidgetTester tester) async {
    final todos = [Todo(id: '1', name: 'Apples'), Todo(id: '2', name: 'Oranges')];
    final widget = TodosWidget(todos: todos);
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Oranges'), findsOneWidget);
  });
}
