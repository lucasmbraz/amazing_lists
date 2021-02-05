import 'package:amazing_lists/model/project.dart';
import 'package:amazing_lists/model/task.dart';
import 'package:flutter/foundation.dart';

class AddProjectAction {
  final Project project;

  AddProjectAction(this.project);
}

class DeleteProjectAction {
  final Project project;

  DeleteProjectAction(this.project);
}

class AddTaskAction {
  final Task task;

  AddTaskAction(this.task);
}

class ToggleTaskCompleteAction {
  final String taskId;

  ToggleTaskCompleteAction({@required this.taskId});
}
