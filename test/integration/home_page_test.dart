import 'package:amazing_lists/home/home_page.dart';
import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/redux/reducers.dart';
import 'package:amazing_lists/tasks/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

main() {
  testWidgets(
      'GIVEN app state has two lists ("Groceries" and "Shopping") '
      'WHEN home page is displayed '
      'THEN it shows both lists', (WidgetTester tester) async {
    final appState = AppState(projects: [
      Project(id: '1', name: 'Groceries', tasks: []),
      Project(id: '2', name: 'Shopping', tasks: []),
    ]);

    final store = Store<AppState>(
      appReducer,
      initialState: appState,
    );

    await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: HomePage(),
        )));

    expect(find.text('Groceries'), findsOneWidget);
    expect(find.text('Shopping'), findsOneWidget);
  });

  testWidgets(
      'GIVEN app state has two lists ("Groceries" and "Shopping") '
      'WHEN home page is displayed '
      'AND user taps "Groceries" '
      'THEN todos page is displayed for "Groceries"', (WidgetTester tester) async {
    final appState = AppState(projects: [
      Project(id: '1', name: 'Groceries', tasks: []),
      Project(id: '2', name: 'Shopping', tasks: []),
    ]);

    final store = Store<AppState>(
      appReducer,
      initialState: appState,
    );

    await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: HomePage(),
        )));

    var groceriesFinder = find.text('Groceries');

    await tester.tap(groceriesFinder);
    await tester.pumpAndSettle();

    expect(find.byType(TasksPage), findsOneWidget);
    expect(groceriesFinder, findsOneWidget);
  });

  // testWidgets(
  //     'GIVEN app state has two lists ("Groceries" and "Shopping") '
  //     'WHEN home page is displayed '
  //     'AND user taps "Groceries" '
  //     'THEN "Groceries" is no longer in the list', (WidgetTester tester) async {
  //   final appState = AppState(todoLists: [
  //     TodoList(id: '1', name: 'Groceries', tasks: []),
  //     TodoList(id: '2', name: 'Shopping', tasks: []),
  //   ]);
  //
  //   final store = Store<AppState>(
  //     appReducer,
  //     initialState: appState,
  //   );
  //
  //   await tester.pumpWidget(StoreProvider(
  //       store: store,
  //       child: MaterialApp(
  //         home: HomePage(),
  //       )));
  //
  //   var groceriesFinder = find.text('Groceries');
  //   expect(groceriesFinder, findsOneWidget);
  //
  //   await tester.tap(groceriesFinder);
  //   await tester.pump();
  //
  //   expect(groceriesFinder, findsNothing);
  // });

  testWidgets(
      'GIVEN app state has one list ("Groceries") '
      'WHEN home page is displayed '
      'AND user taps the add button '
      'AND user types in "Shopping" '
      'AND user taps "add" '
      'THEN "Shopping" is now in the list', (WidgetTester tester) async {
    final appState = AppState(projects: [
      Project(id: '1', name: 'Groceries', tasks: []),
    ]);

    final store = Store<AppState>(
      appReducer,
      initialState: appState,
    );

    await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: HomePage(),
        )));

    var shoppingFinder = find.text('Shopping');
    expect(shoppingFinder, findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    await tester.enterText(find.byType(TextField), 'Shopping');
    await tester.tap(find.text('ADD'));
    await tester.pump();

    expect(shoppingFinder, findsOneWidget);
  });
}
