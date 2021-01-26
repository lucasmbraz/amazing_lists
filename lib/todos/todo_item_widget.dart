import 'package:amazing_lists/model/todo.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    Key key,
    @required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircularCheckBox(
          inactiveColor: Theme.of(context).primaryColor,
          value: false,
          onChanged: (value) {},
        ),
        title: Text(todo.name),
      ),
    );
  }
}
