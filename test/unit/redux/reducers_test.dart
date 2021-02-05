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
      final project = Project(id: '1', name: 'Groceries');
      final oldState = AppState(projects: {}, tasks: {});
      final action = AddProjectAction(project);
      final expectedState = AppState(projects: {'1': project}, tasks: {});

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });

    test(
        'GIVEN app state has one project '
        'WHEN delete project action is called '
        'THEN app state is empty', () {
      final project = Project(id: '1', name: 'Groceries');
      final oldState = AppState(projects: {'1': project}, tasks: {});
      final action = DeleteProjectAction(project);
      final expectedState = AppState(projects: {}, tasks: {});

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });
  });

  group('Task', () {
    test(
        'GIVEN app state has one empty project '
        'WHEN add task action is called '
        'THEN the project has one task ', () {
      final project = Project(id: '1', name: 'Groceries');
      final task = Task(id: '1', name: 'Apples', complete: false, projectId: '1');
      final oldState = AppState(projects: {'1': project}, tasks: {});
      final action = AddTaskAction(task);
      final expectedState = AppState(
        projects: {'1': project},
        tasks: {'1': task},
      );

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });

    test(
        'GIVEN app state has one task '
        'WHEN toggle complete action is called '
        'THEN the task is complete ', () {
      final project = Project(id: '1', name: 'Groceries');
      final task = Task(id: '1', name: 'Apples', complete: false, projectId: '1');
      final oldState = AppState(
        projects: {'1': project},
        tasks: {'1': task},
      );
      final action = ToggleTaskCompleteAction(taskId: '1');
      final expectedState = AppState(
        projects: {'1': project},
        tasks: {'1': Task(id: '1', name: 'Apples', complete: true, projectId: '1')},
      );

      final actualState = appReducer(oldState, action);

      expect(actualState, expectedState);
    });
  });
}
