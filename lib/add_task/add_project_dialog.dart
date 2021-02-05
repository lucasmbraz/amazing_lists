import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  final OnAddTaskCallback callback;

  const AddTaskDialog(this.callback);

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  String taskName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Add a task'),
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
              widget.callback(taskName);
            })
      ],
    );
  }

  _handleTextChanged(String newListName) {
    setState(() {
      taskName = newListName;
    });
  }
}

typedef OnAddTaskCallback = Function(String taskName);
