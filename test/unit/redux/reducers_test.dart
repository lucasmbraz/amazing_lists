import 'package:flutter_test/flutter_test.dart';
import 'package:amazing_lists/model/todo.dart';
import 'package:amazing_lists/model/todo_list.dart';
import 'package:amazing_lists/redux/actions.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/redux/reducers.dart';

void main() {
  group('Todo List', () {
    test(
        'GIVEN app state is empty '
        'WHEN add list action is called '
        'THEN app state has one todo list', () {
      final oldState = AppState(todoLists: []);
      final action = AddTodoListAction(TodoList(id: '1', name: 'Groceries', todos: []));
      final expectedState = AppState(todoLists: [TodoList(id: '1', name: 'Groceries', todos: [])]);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });

    test(
        'GIVEN app state has one todo list '
        'WHEN delete list action is called '
        'THEN app state is empty', () {
      final oldState = AppState(todoLists: [TodoList(id: '1', name: 'Groceries', todos: [])]);
      final action = DeleteTodoListAction(TodoList(id: '1', name: 'Groceries', todos: []));
      final expectedState = AppState(todoLists: []);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });
  });

  group('Todo Item', () {
    test(
        'GIVEN app state has one empty todo list '
        'WHEN add todo action is called '
        'THEN the list has one item ', () {
      final oldState = AppState(todoLists: [TodoList(id: '1', name: 'Groceries', todos: [])]);
      final action = AddTodoAction(TodoList(id: '1', name: 'Groceries', todos: []), Todo(id: '1', name: 'Apples'));
      final expectedState = AppState(todoLists: [
        TodoList(
          id: '1',
          name: 'Groceries',
          todos: [Todo(id: '1', name: 'Apples')],
        )
      ]);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });
  });
}
