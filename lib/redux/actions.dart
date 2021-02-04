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
  final Project project;
  final Task task;

  AddTaskAction(this.project, this.task);
}

class ToggleTaskCompleteAction {
  final String projectId;
  final String taskId;

  ToggleTaskCompleteAction({@required this.projectId, @required this.taskId});
}
