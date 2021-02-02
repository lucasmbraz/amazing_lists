import 'package:amazing_lists/model/task.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    Key key,
    @required this.task,
  }) : super(key: key);

  final Task task;

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
      ),
    );
  }
}
