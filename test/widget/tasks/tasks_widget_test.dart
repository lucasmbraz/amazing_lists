import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/tasks/task_item_widget.dart';
import 'package:amazing_lists/tasks/tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTapCallback extends Mock {
  void call(Task task);
}

void main() {
  final tasks = [Task(id: '1', name: 'Apples', complete: false), Task(id: '2', name: 'Oranges', complete: false)];
  OnTapTaskCallback callback;
  TasksWidget widget;

  setUp(() {
    callback = MockTapCallback();
    widget = TasksWidget(tasks: tasks, onTapCallback: callback);
  });

  testWidgets(
      'GIVEN a list of tasks '
      'WHEN TasksWidget is displayed '
      'THEN it shows all tasks', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Oranges'), findsOneWidget);
  });

  testWidgets(
      'GIVEN TasksWidget is displayed '
      'WHEN a task is tapped '
      'THEN callback is called', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    await tester.tap(find.text('Apples'));

    verify(callback(tasks.first));
  });
}
