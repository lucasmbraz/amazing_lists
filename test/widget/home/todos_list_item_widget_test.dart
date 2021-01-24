import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/home/todos_list_item_widget.dart';
import 'package:flutter_todo/model/todo_list.dart';
import 'package:mockito/mockito.dart';

class MockTapCallback extends Mock {
  void call(TodoList todoList);
}

void main() {
  TodoList todoList;
  OnTapTodoListCallback callback;
  TodosListItemWidget widget;

  setUp(() {
    todoList = TodoList(id: '1', name: 'Groceries');
    callback = MockTapCallback();
    widget = TodosListItemWidget(todoList: todoList, onTapCallback: callback);
  });

  testWidgets('TodosListItemWidget shows a list name', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    final nameFinder = find.text('Groceries');

    expect(nameFinder, findsOneWidget);
  });

  testWidgets('TodosListItem Widget calls callback when item tapped', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    await tester.tap(find.text('Groceries'));

    verify(callback.call(TodoList(id: '1', name: 'Groceries')));
  });
}
