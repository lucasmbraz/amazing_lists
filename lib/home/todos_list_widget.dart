import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/home/todos_list_item_widget.dart';
import 'package:flutter_todo/model/todo_list.dart';
import 'package:flutter_todo/redux/app_state.dart';
import 'package:redux/redux.dart';

class TodosListWidget extends StatelessWidget {
  const TodosListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _TodosListViewModel>(
        converter: (store) => _TodosListViewModel.from(store),
        builder: (context, vm) {
          return ListView.separated(
            itemCount: vm.todoLists.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => TodosListItemWidget(todoList: vm.todoLists[index]),
          );
        });
  }
}

class _TodosListViewModel {
  final List<TodoList> todoLists;

  _TodosListViewModel(this.todoLists);

  static _TodosListViewModel from(Store<AppState> store) => _TodosListViewModel(store.state.todoLists);
}
