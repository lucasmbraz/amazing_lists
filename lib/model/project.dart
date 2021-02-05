import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

@freezed
abstract class Project implements _$Project {
  const Project._();

  const factory Project({
    @required String id,
    @required String name,
  }) = _Project;
}
