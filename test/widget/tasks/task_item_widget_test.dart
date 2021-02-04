import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/tasks/task_item_widget.dart';
import 'package:circular_check_box/circular_check_box.dart';
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
    task = Task(id: '1', name: 'Apples', complete: false);
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

  testWidgets(
      'GIVEN TaskItemWidget is displayed '
      'WHEN the checkbox is tapped '
      'THEN callback is called ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    await tester.tap(find.byType(CircularCheckBox));

    verify(callback.call(task));
  });

  testWidgets(
      'GIVEN task is not complete '
      'WHEN TaskItemWidget is displayed '
      'THEN checkbox is unchecked ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(tester.widget<CircularCheckBox>(find.byType(CircularCheckBox)).value, false);
  });

  testWidgets(
      'GIVEN task is complete '
      'WHEN TaskItemWidget is displayed '
      'THEN checkbox is checked ', (WidgetTester tester) async {
    task = Task(id: '1', name: 'Apples', complete: true);
    widget = TaskItemWidget(task: task, onTapCallback: callback);
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(tester.widget<CircularCheckBox>(find.byType(CircularCheckBox)).value, true);
  });
}
