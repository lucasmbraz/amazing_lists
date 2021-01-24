import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/model/todo_list.dart';
import 'package:flutter_todo/redux/actions.dart';
import 'package:flutter_todo/redux/app_state.dart';
import 'package:flutter_todo/redux/reducers.dart';

void main() {
  group('Todo List', () {
    test(
        'WHEN app state is empty '
        'AND add list action is called '
        'THEN app state has one todo list', () {
      final oldState = AppState(todoLists: []);
      final action = AddTodoListAction(TodoList(id: '1', name: 'Groceries'));
      final expectedState = AppState(todoLists: [TodoList(id: '1', name: 'Groceries')]);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });

    test(
        'WHEN app state has one todo list '
        'AND delete list action is called '
        'THEN app state is empty', () {
      final oldState = AppState(todoLists: [TodoList(id: '1', name: 'Groceries')]);
      final action = DeleteTodoListAction(TodoList(id: '1', name: 'Groceries'));
      final expectedState = AppState(todoLists: []);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });
  });

  group('Todo Item', () {});
}
