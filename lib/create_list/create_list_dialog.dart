import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/redux/actions.dart';
import 'package:flutter_todo/redux/app_state.dart';

class CreateListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnCreateListCallback>(
      converter: (store) {
        return (listName) => store.dispatch(CreateListAction(listName));
      },
      builder: (context, callback) => CreateListDialogWidget(callback),
    );
  }
}

class CreateListDialogWidget extends StatefulWidget {
  final OnCreateListCallback callback;

  const CreateListDialogWidget(this.callback);

  @override
  _CreateListDialogWidgetState createState() => _CreateListDialogWidgetState();
}

class _CreateListDialogWidgetState extends State<CreateListDialogWidget> {
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

typedef OnCreateListCallback = Function(String listName);
