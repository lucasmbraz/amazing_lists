import 'package:amazing_lists/add_task/add_project_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAddCallback extends Mock {
  void call(String taskName);
}

void main() {
  OnAddTaskCallback addCallback;
  AddTaskDialog dialog;

  setUp(() {
    addCallback = MockAddCallback();
    dialog = AddTaskDialog(addCallback);
  });

  testWidgets(
      'GIVEN AddTaskDialog is displayed '
      'WHEN user taps "cancel" '
      'THEN nothing happens', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: dialog)));

    await tester.tap(find.text('CANCEL'));

    verifyNever(addCallback.call(any));
  });

  testWidgets(
      'GIVEN AddTaskDialog is displayed '
      'WHEN user types in a task name '
      'AND taps "add" '
      'THEN the callback is called', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: dialog)));

    await tester.enterText(find.byType(TextField), 'Strawberries');
    await tester.tap(find.text('ADD'));

    verify(addCallback.call('Strawberries'));
  });
}
