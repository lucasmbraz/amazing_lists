import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/model/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState implements _$AppState {
  const AppState._();

  const factory AppState({
    @required Map<String, Project> projects,
    @required Map<String, Task> tasks,
  }) = _AppState;

  factory AppState.init() => AppState(
        projects: {
          '1': Project(id: '1', name: 'Groceries'),
          '2': Project(id: '2', name: 'Chores'),
          '3': Project(id: '3', name: 'Shopping'),
          '4': Project(id: '4', name: 'Books to read'),
          '5': Project(id: '5', name: 'Movies to watch'),
        },
        tasks: {
          '1': Task(id: '1', name: 'Apples', complete: false, projectId: '1'),
          '2': Task(id: '2', name: 'Oranges', complete: false, projectId: '1'),
        },
      );
}
