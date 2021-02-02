import 'package:flutter_test/flutter_test.dart';
import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/redux/actions.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/redux/reducers.dart';

void main() {
  group('Todo List', () {
    test(
        'GIVEN app state is empty '
        'WHEN add list action is called '
        'THEN app state has one todo list', () {
      final oldState = AppState(projects: []);
      final action = AddProjectAction(Project(id: '1', name: 'Groceries', tasks: []));
      final expectedState = AppState(projects: [Project(id: '1', name: 'Groceries', tasks: [])]);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });

    test(
        'GIVEN app state has one todo list '
        'WHEN delete list action is called '
        'THEN app state is empty', () {
      final oldState = AppState(projects: [Project(id: '1', name: 'Groceries', tasks: [])]);
      final action = DeleteProjectAction(Project(id: '1', name: 'Groceries', tasks: []));
      final expectedState = AppState(projects: []);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });
  });

  group('Todo Item', () {
    test(
        'GIVEN app state has one empty todo list '
        'WHEN add todo action is called '
        'THEN the list has one item ', () {
      final oldState = AppState(projects: [Project(id: '1', name: 'Groceries', tasks: [])]);
      final action = AddTaskAction(Project(id: '1', name: 'Groceries', tasks: []), Task(id: '1', name: 'Apples'));
      final expectedState = AppState(projects: [
        Project(
          id: '1',
          name: 'Groceries',
          tasks: [Task(id: '1', name: 'Apples')],
        )
      ]);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });
  });
}
