import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/tasks/task_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTapCallback extends Mock {
  void call(Task task);
}

main() {
  Task task;
  OnTapTaskCallback callback;
  TaskItemWidget widget;

  setUp(() {
    task = Task(id: '1', name: 'Apples');
    callback = MockTapCallback();
    widget = TaskItemWidget(task: task, onTapCallback: callback);
  });

  testWidgets(
      'WHEN TaskItemWidget is displayed '
      'THEN it shows the task title ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(find.text('Apples'), findsOneWidget);
  });

  testWidgets(
      'GIVEN TaskItemWidget is displayed '
      'WHEN it is tapped '
      'THEN callback is called ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    await tester.tap(find.text('Apples'));

    verify(callback.call(task));
  });
}
