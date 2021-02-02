import 'package:amazing_lists/model/task.dart';
import 'package:amazing_lists/tasks/task_item_widget.dart';
import 'package:flutter/material.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({
    Key key,
    @required this.tasks,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: TaskItemWidget(task: tasks[index]),
      ),
    );
  }
}
