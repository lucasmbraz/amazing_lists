import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/todos/todo_widget.dart';

main() {
  testWidgets(
      'WHEN TodoWidget is displayed '
      'THEN it shows the todo title ', (WidgetTester tester) async {
    final todo = Todo(id: '1', name: 'Apples');
    final widget = TodoWidget(todo: todo);
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(find.text('Apples'), findsOneWidget);
  });
}
