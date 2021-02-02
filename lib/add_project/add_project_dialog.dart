import 'package:flutter/material.dart';

class AddProjectDialog extends StatefulWidget {
  final OnAddProjectCallback callback;

  const AddProjectDialog(this.callback);

  @override
  _AddProjectDialogState createState() => _AddProjectDialogState();
}

class _AddProjectDialogState extends State<AddProjectDialog> {
  String projectName;

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
              widget.callback(projectName);
            })
      ],
    );
  }

  _handleTextChanged(String newListName) {
    setState(() {
      projectName = newListName;
    });
  }
}

typedef OnAddProjectCallback = Function(String projectName);
