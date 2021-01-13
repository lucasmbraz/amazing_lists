import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list.freezed.dart';

@freezed
abstract class TodoList with _$TodoList {
  const factory TodoList({
    @required String name,
  }) = _TodoList;
}
