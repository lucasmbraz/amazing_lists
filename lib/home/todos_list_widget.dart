import 'package:amazing_lists/home/todos_list_item_widget.dart';
import 'package:amazing_lists/model/todo_list.dart';
import 'package:flutter/material.dart';

class TodosListWidget extends StatelessWidget {
  const TodosListWidget({
    Key key,
    @required this.todoLists,
    @required this.onTapCallback,
  }) : super(key: key);

  final List<TodoList> todoLists;
  final OnTapTodoListCallback onTapCallback;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: todoLists.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => TodosListItemWidget(
        todoList: todoLists[index],
        onTapCallback: onTapCallback,
      ),
    );
  }
}
