import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/model/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState implements _$AppState {
  const AppState._();

  const factory AppState({
    @required List<Project> projects,
  }) = _AppState;

  factory AppState.init() => AppState(
        projects: [
          Project(id: '1', name: 'Groceries', tasks: [
            Task(id: '1', name: 'Apples', complete: false),
            Task(id: '2', name: 'Oranges', complete: true),
          ]),
          Project(id: '2', name: 'Chores', tasks: []),
          Project(id: '3', name: 'Shopping', tasks: []),
          Project(id: '4', name: 'Books to read', tasks: []),
          Project(id: '5', name: 'Movies to watch', tasks: []),
        ],
      );
}
