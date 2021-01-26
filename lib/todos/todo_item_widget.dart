import 'package:flutter/material.dart';
import 'package:amazing_lists/model/todo.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    Key key,
    @required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.name),
    );
  }
}
