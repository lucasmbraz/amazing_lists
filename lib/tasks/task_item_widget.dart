import 'package:amazing_lists/model/task.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    Key key,
    @required this.task,
    @required this.onTapCallback,
  }) : super(key: key);

  final Task task;
  final OnTapTaskCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircularCheckBox(
          inactiveColor: Theme.of(context).primaryColor,
          value: false,
          onChanged: (value) {},
        ),
        title: Text(task.name),
        onTap: () => onTapCallback(task),
      ),
    );
  }
}

typedef OnTapTaskCallback = Function(Task task);
