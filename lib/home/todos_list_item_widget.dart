import 'package:amazing_lists/model/todo_list.dart';
import 'package:flutter/material.dart';

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
      leading: Icon(
        Icons.list,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(todoList.name),
      onTap: () => onTapCallback(todoList),
    );
  }
}

typedef OnTapTodoListCallback = Function(TodoList todoList);
