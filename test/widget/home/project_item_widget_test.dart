import 'package:amazing_lists/home/project_item_widget.dart';
import 'package:amazing_lists/model/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTapCallback extends Mock {
  void call(Project project);
}

void main() {
  Project project;
  OnTapProjectCallback callback;
  ProjectItemWidget widget;

  setUp(() {
    project = Project(id: '1', name: 'Groceries');
    callback = MockTapCallback();
    widget = ProjectItemWidget(project: project, onTapCallback: callback);
  });

  testWidgets('ProjectItemWidget shows a project name', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    final nameFinder = find.text('Groceries');

    expect(nameFinder, findsOneWidget);
  });

  testWidgets('ProjectItemWidget calls callback when item tapped', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    await tester.tap(find.text('Groceries'));

    verify(callback.call(Project(id: '1', name: 'Groceries')));
  });
}
