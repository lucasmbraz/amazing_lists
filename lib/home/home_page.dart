import 'package:flutter/material.dart';
import 'package:flutter_todo/create_list/create_list_dialog.dart';
import 'package:flutter_todo/home/todos_list_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
      ),
      body: TodosListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openCreateListDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  _openCreateListDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => CreateListDialog());
  }
}
