import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/model/todo_list.dart';
import 'package:flutter_todo/redux/app_state.dart';
import 'package:flutter_todo/redux/reducers.dart';
import 'package:flutter_todo/todos/todos_page.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets(
      'GIVEN app state has a list with two items '
      'WHEN todo page is displayed '
      'THEN it shows the list name '
      'AND it shows all the todos', (WidgetTester tester) async {
    final appState = AppState(todoLists: [
      TodoList(id: '1', name: 'Groceries', todos: [
        Todo(id: '1', name: 'Apples'),
        Todo(id: '2', name: 'Oranges'),
      ]),
    ]);

    final store = Store<AppState>(
      appReducer,
      initialState: appState,
    );

    await tester.pumpWidget(StoreProvider(
        store: store,
        child: MaterialApp(
          home: TodoPage(listId: '1'),
        )));

    expect(find.text('Groceries'), findsOneWidget);
    expect(find.text('Apples'), findsOneWidget);
    expect(find.text('Oranges'), findsOneWidget);
  });
}
