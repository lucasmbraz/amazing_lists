import 'package:amazing_lists/model/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

@freezed
abstract class Project implements _$Project {
  const Project._();

  const factory Project({
    @required String id,
    @required String name,
    @required List<Task> tasks,
  }) = _Project;

  Project addTodo(Task todo) {
    return copyWith(
      tasks: [...tasks]..add(todo),
    );
  }
}
