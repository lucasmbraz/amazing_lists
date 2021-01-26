import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:amazing_lists/model/todo_list.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/todos/todos_widget.dart';
import 'package:redux/redux.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({
    Key key,
    @required this.listId,
  }) : super(key: key);

  final String listId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.from(store, listId),
      builder: (context, vm) => Scaffold(
        appBar: AppBar(
          title: Text(vm.todoList.name),
        ),
        body: TodosWidget(
          todos: vm.todoList.todos,
        ),
      ),
    );
  }
}

class _ViewModel {
  _ViewModel(this.todoList);

  final TodoList todoList;

  static _ViewModel from(Store<AppState> store, String listId) => _ViewModel(store.state.todoLists.firstWhere((todoList) => todoList.id == listId));
}
