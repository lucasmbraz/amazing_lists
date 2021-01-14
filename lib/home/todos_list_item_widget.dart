import 'package:flutter/material.dart';
import 'package:flutter_todo/model/todo_list.dart';

class TodosListItemWidget extends StatelessWidget {
  const TodosListItemWidget({
    Key key,
    @required this.todoList,
  }) : super(key: key);

  final TodoList todoList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todoList.name),
    );
  }
}