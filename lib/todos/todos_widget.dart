import 'package:flutter/material.dart';
import 'package:amazing_lists/model/todo.dart';
import 'package:amazing_lists/todos/todo_item_widget.dart';

class TodosWidget extends StatelessWidget {
  const TodosWidget({
    Key key,
    @required this.todos,
  }) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => TodoItemWidget(todo: todos[index]),
    );
  }
}
