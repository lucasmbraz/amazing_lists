import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/model/todo_list.dart';
import 'package:flutter_todo/redux/app_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
      ),
      body: StoreConnector<AppState, List<TodoList>>(
          converter: (store) => store.state.todoLists,
          builder: (context, todoLists) {
            return ListView.separated(
              itemCount: todoLists.length,
              itemBuilder: (context, index) {
                final todoList = todoLists[index];
                return ListTile(
                  title: Text(todoList.name),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }),
    );
  }
}
