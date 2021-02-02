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
  testWidgets(
      'GIVEN app state has a list with two items '
      'WHEN todo page is displayed '
      'THEN it shows the list name '
      'AND it shows all the todos', (WidgetTester tester) async {
    final appState = AppState(projects: [
      Project(id: '1', name: 'Groceries', tasks: [
        Task(id: '1', name: 'Apples'),
        Task(id: '2', name: 'Oranges'),
      ]),
    ]);

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
}
