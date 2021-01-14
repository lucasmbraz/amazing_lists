import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/add_todo_list/add_todo_list_dialog.dart';
import 'package:flutter_todo/home/todos_list_widget.dart';
import 'package:flutter_todo/model/todo_list.dart';
import 'package:flutter_todo/redux/actions.dart';
import 'package:flutter_todo/redux/app_state.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(builder: (context, store) {
      return Scaffold(
        appBar: AppBar(
          title: Text('TODO'),
        ),
        body: TodosListWidget(
          onTapCallback: (todoList) => store.dispatch(DeleteTodoListAction(todoList)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openAddTodoListDialog(context, store),
          child: const Icon(Icons.add),
        ),
      );
    });
  }

  _openAddTodoListDialog(BuildContext context, Store<AppState> store) {
    showDialog(
      context: context,
      builder: (context) => AddTodoListDialog(
        (listName) => store.dispatch(AddTodoListAction(TodoList(name: listName))),
      ),
    );
  }
}
