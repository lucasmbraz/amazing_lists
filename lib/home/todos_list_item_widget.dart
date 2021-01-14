import 'package:flutter/material.dart';
import 'package:flutter_todo/model/todo_list.dart';

class TodosListItemWidget extends StatelessWidget {
  final TodoList todoList;
  final OnTapTodoListCallback onTapCallback;

  const TodosListItemWidget({
    Key key,
    @required this.todoList,
    @required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todoList.name),
      onTap: () => onTapCallback(todoList),
    );
  }
}

typedef OnTapTodoListCallback = Function(TodoList todoList);
