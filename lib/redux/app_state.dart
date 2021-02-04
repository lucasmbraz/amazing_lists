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
          Project(id: '1', name: 'List #1', tasks: [Task(id: '1', name: 'Apples', complete: false), Task(id: '2', name: 'Oranges', complete: false)]),
          Project(id: '2', name: 'List #2', tasks: []),
          Project(id: '3', name: 'List #3', tasks: []),
          Project(id: '4', name: 'List #4', tasks: []),
          Project(id: '5', name: 'List #5', tasks: []),
          Project(id: '6', name: 'List #6', tasks: []),
          Project(id: '7', name: 'List #7', tasks: []),
          Project(id: '8', name: 'List #8', tasks: []),
          Project(id: '9', name: 'List #9', tasks: []),
          Project(id: '10', name: 'List #10', tasks: []),
          Project(id: '11', name: 'List #11', tasks: []),
          Project(id: '12', name: 'List #12', tasks: []),
          Project(id: '13', name: 'List #13', tasks: []),
          Project(id: '14', name: 'List #14', tasks: []),
          Project(id: '15', name: 'List #15', tasks: []),
        ],
      );
}
