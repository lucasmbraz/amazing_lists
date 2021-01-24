import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/add_todo_list/add_todo_list_dialog.dart';
import 'package:mockito/mockito.dart';

class MockAddCallback extends Mock {
  void call(String listName);
}

void main() {
  OnAddTodoListCallback addCallback;
  AddTodoListDialog dialog;

  setUp(() {
    addCallback = MockAddCallback();
    dialog = AddTodoListDialog(addCallback);
  });

  testWidgets(
      'GIVEN AddTodoListDialog is displayed '
      'WHEN user taps "cancel" '
      'THEN nothing happens', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: dialog)));

    await tester.tap(find.text('CANCEL'));

    verifyNever(addCallback.call(any));
  });

  testWidgets(
      'GIVEN AddTodoListDialog is displayed '
      'WHEN user types in a list name '
      'AND taps "add" '
      'THEN the callback is called', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: dialog)));

    await tester.enterText(find.byType(TextField), 'Shopping');
    await tester.tap(find.text('ADD'));

    verify(addCallback.call('Shopping'));
  });
}
