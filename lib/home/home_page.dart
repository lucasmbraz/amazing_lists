import 'package:amazing_lists/add_todo_list/add_todo_list_dialog.dart';
import 'package:amazing_lists/home/todos_list_item_widget.dart';
import 'package:amazing_lists/home/todos_list_widget.dart';
import 'package:amazing_lists/model/todo_list.dart';
import 'package:amazing_lists/redux/actions.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/todos/todos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatelessWidget {
  final uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.from(context, store, uuid),
        builder: (context, vm) {
          return Scaffold(
            appBar: AppBar(
              title: Text('TODO'),
            ),
            body: _body(vm),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => _openAddTodoListDialog(context, vm),
              child: const Icon(Icons.add),
            ),
          );
        });
  }

  Widget _body(_ViewModel vm) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: TodosListWidget(
            todoLists: vm.todoLists,
            onTapCallback: vm.onTapTodoListCallback,
          ),
        ),
      ),
    );
  }

  _openAddTodoListDialog(BuildContext context, _ViewModel vm) {
    showDialog(
      context: context,
      builder: (context) => AddTodoListDialog(vm.onAddTodoListCallback),
    );
  }
}

class _ViewModel {
  _ViewModel(
    this.todoLists, {
    @required this.onAddTodoListCallback,
    @required this.onTapTodoListCallback,
  });

  final List<TodoList> todoLists;
  final OnAddTodoListCallback onAddTodoListCallback;
  final OnTapTodoListCallback onTapTodoListCallback;

  static _ViewModel from(BuildContext context, Store<AppState> store, Uuid uuid) => _ViewModel(
        store.state.todoLists,
        onAddTodoListCallback: (listName) => store.dispatch(AddTodoListAction(TodoList(id: uuid.v4(), name: listName, todos: []))),
        onTapTodoListCallback: (todoList) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoPage(listId: todoList.id),
          ),
        ),
      );
}
