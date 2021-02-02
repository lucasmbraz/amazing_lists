import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/tasks/tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'GIVEN a list of tasks '
      'WHEN TasksWidget is displayed '
      'THEN it shows all tasks', (WidgetTester tester) async {
    final tasks = [Task(id: '1', name: 'Apples'), Task(id: '2', name: 'Oranges')];
    final widget = TasksWidget(tasks: tasks);
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Oranges'), findsOneWidget);
  });
}
