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
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.from(store),
      builder: (context, vm) => Scaffold(
        appBar: AppBar(
          title: Text('TODO'),
        ),
        body: TodosListWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openCreateListDialog(context, vm.callback),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  _openCreateListDialog(BuildContext context, OnAddTodoListCallback callback) {
    showDialog(
      context: context,
      builder: (context) => AddTodoListDialog(callback),
    );
  }
}

class _ViewModel {
  final OnAddTodoListCallback callback;

  _ViewModel(this.callback);

  static _ViewModel from(Store<AppState> store) => _ViewModel(
        (listName) => store.dispatch(AddTodoListAction(TodoList(name: listName))),
      );
}
