import 'package:flutter/material.dart';
import 'package:flutter_todo/model/todo.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
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
