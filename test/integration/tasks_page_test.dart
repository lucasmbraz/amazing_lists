import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/redux/reducers.dart';
import 'package:amazing_lists/tasks/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  final tasks = [Task(id: '1', name: 'Apples', complete: false), Task(id: '2', name: 'Oranges', complete: false)];
  final project = Project(id: '1', name: 'Groceries', tasks: tasks);

  testWidgets(
      'GIVEN app state has a project with two tasks '
      'WHEN TasksPage is displayed '
      'THEN it shows the project name '
      'AND it shows all the tasks', (WidgetTester tester) async {
    final appState = AppState(projects: [project]);

    final store = Store<AppState>(
      appReducer,
      initialState: appState,
    );

    await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: TasksPage(projectId: '1'),
        )));

    expect(find.text('Groceries'), findsOneWidget);
    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Oranges'), findsOneWidget);
  });

  testWidgets(
      'GIVEN app state has a project with two tasks '
      'AND TasksPage is displayed '
      'WHEN task is tapped '
      'THEN the task is now complete', (WidgetTester tester) async {
    final appState = AppState(projects: [project]);

    final store = Store<AppState>(
      appReducer,
      initialState: appState,
    );

    await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: TasksPage(projectId: '1'),
        )));

    await tester.tap(find.text('Apples'));

    expect(store.state.projects.first.tasks.first.complete, true);
  });
}
