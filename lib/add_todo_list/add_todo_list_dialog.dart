import 'package:flutter/material.dart';

class AddTodoListDialog extends StatefulWidget {
  final OnAddTodoListCallback callback;

  const AddTodoListDialog(this.callback);

  @override
  _AddTodoListDialogState createState() => _AddTodoListDialogState();
}

class _AddTodoListDialogState extends State<AddTodoListDialog> {
  String listName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'List name', hintText: 'eg. Groceries'),
              onChanged: _handleTextChanged,
            ),
          )
        ],
      ),
      actions: [
        FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            }),
        FlatButton(
            child: const Text('ADD'),
            onPressed: () {
              Navigator.pop(context);
              widget.callback(listName);
            })
      ],
    );
  }

  _handleTextChanged(String newListName) {
    setState(() {
      listName = newListName;
    });
  }
}

typedef OnAddTodoListCallback = Function(String listName);
