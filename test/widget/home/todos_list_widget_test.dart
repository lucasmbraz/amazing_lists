import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amazing_lists/home/todos_list_item_widget.dart';
import 'package:amazing_lists/home/todos_list_widget.dart';
import 'package:amazing_lists/model/todo_list.dart';
import 'package:mockito/mockito.dart';

class MockTapCallback extends Mock {
  void call(TodoList todoList);
}

void main() {
  List<TodoList> todoLists;
  OnTapTodoListCallback tapCallback;
  TodosListWidget widget;

  setUp(() {
    todoLists = [TodoList(id: '1', name: 'Groceries', todos: []), TodoList(id: '2', name: 'Shopping', todos: [])];
    tapCallback = MockTapCallback();
    widget = TodosListWidget(
      todoLists: todoLists,
      onTapCallback: tapCallback,
    );
  });

  testWidgets('TodosListWidget shows all todo lists', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    final groceriesFinder = find.text('Groceries');
    final shoppingFinder = find.text('Shopping');

    expect(groceriesFinder, findsOneWidget);
    expect(shoppingFinder, findsOneWidget);
  });

  testWidgets('TodosListWidget calls callback when item tapped', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    await tester.tap(find.text('Shopping'));

    verify(tapCallback.call(TodoList(id: '2', name: 'Shopping', todos: [])));
  });
}
