import 'package:amazing_lists/home/project_item_widget.dart';
import 'package:amazing_lists/home/projects_widget.dart';
import 'package:amazing_lists/model/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTapCallback extends Mock {
  void call(Project todoList);
}

void main() {
  List<Project> todoLists;
  OnTapProjectCallback tapCallback;
  ProjectsWidget widget;

  setUp(() {
    todoLists = [
      Project(id: '1', name: 'Groceries'),
      Project(id: '2', name: 'Shopping'),
    ];
    tapCallback = MockTapCallback();
    widget = ProjectsWidget(
      projects: todoLists,
      onTapCallback: tapCallback,
    );
  });

  testWidgets('ProjectsWidget shows all todo lists', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    final groceriesFinder = find.text('Groceries');
    final shoppingFinder = find.text('Shopping');

    expect(groceriesFinder, findsOneWidget);
    expect(shoppingFinder, findsOneWidget);
  });

  testWidgets('ProjectsWidget calls callback when item tapped', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    await tester.tap(find.text('Shopping'));

    verify(tapCallback.call(Project(id: '2', name: 'Shopping')));
  });
}
