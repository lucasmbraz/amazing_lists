import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/redux/actions.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/redux/reducers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Project', () {
    test(
        'GIVEN app state is empty '
        'WHEN add project action is called '
        'THEN app state has one project', () {
      final oldState = AppState(projects: []);
      final action = AddProjectAction(Project(id: '1', name: 'Groceries', tasks: []));
      final expectedState = AppState(projects: [Project(id: '1', name: 'Groceries', tasks: [])]);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });

    test(
        'GIVEN app state has one project '
        'WHEN delete project action is called '
        'THEN app state is empty', () {
      final oldState = AppState(projects: [Project(id: '1', name: 'Groceries', tasks: [])]);
      final action = DeleteProjectAction(Project(id: '1', name: 'Groceries', tasks: []));
      final expectedState = AppState(projects: []);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });
  });

  group('Task', () {
    test(
        'GIVEN app state has one empty project '
        'WHEN add task action is called '
        'THEN the project has one task ', () {
      final oldState = AppState(projects: [Project(id: '1', name: 'Groceries', tasks: [])]);
      final action = AddTaskAction(Project(id: '1', name: 'Groceries', tasks: []), Task(id: '1', name: 'Apples', complete: false));
      final expectedState = AppState(projects: [
        Project(
          id: '1',
          name: 'Groceries',
          tasks: [Task(id: '1', name: 'Apples', complete: false)],
        )
      ]);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });

    test(
        'GIVEN app state has one task '
        'WHEN toggle complete action is called '
        'THEN the task is complete ', () {
      final task = Task(id: '1', name: 'Apples', complete: false);
      final oldState = AppState(projects: [
        Project(id: '1', name: 'Groceries', tasks: [task])
      ]);
      final action = ToggleTaskCompleteAction(projectId: '1', taskId: '1');
      final expectedState = AppState(projects: [
        Project(
          id: '1',
          name: 'Groceries',
          tasks: [Task(id: '1', name: 'Apples', complete: true)],
        )
      ]);

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });
  });
}
