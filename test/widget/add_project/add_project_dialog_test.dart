import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amazing_lists/add_project/add_project_dialog.dart';
import 'package:mockito/mockito.dart';

class MockAddCallback extends Mock {
  void call(String listName);
}

void main() {
  OnAddProjectCallback addCallback;
  AddProjectDialog dialog;

  setUp(() {
    addCallback = MockAddCallback();
    dialog = AddProjectDialog(addCallback);
  });

  testWidgets(
      'GIVEN AddProjectDialog is displayed '
      'WHEN user taps "cancel" '
      'THEN nothing happens', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: dialog)));

    await tester.tap(find.text('CANCEL'));

    verifyNever(addCallback.call(any));
  });

  testWidgets(
      'GIVEN AddProjectDialog is displayed '
      'WHEN user types in a list name '
      'AND taps "add" '
      'THEN the callback is called', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: dialog)));

    await tester.enterText(find.byType(TextField), 'Shopping');
    await tester.tap(find.text('ADD'));

    verify(addCallback.call('Shopping'));
  });
}
