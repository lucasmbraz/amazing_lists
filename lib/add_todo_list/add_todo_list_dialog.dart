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
//
// class AddTodoListDialogWidget extends StatefulWidget {
//   final OnAddTodoListCallback callback;
//
//   const AddTodoListDialogWidget(this.callback);
//
//   @override
//   _AddTodoListDialogWidgetState createState() => _AddTodoListDialogWidgetState();
// }
//
// class _AddTodoListDialogWidgetState extends State<AddTodoListDialogWidget> {
//   String listName;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       contentPadding: const EdgeInsets.all(16.0),
//       content: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               autofocus: true,
//               decoration: InputDecoration(labelText: 'List name', hintText: 'eg. Groceries'),
//               onChanged: _handleTextChanged,
//             ),
//           )
//         ],
//       ),
//       actions: [
//         FlatButton(
//             child: const Text('CANCEL'),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         FlatButton(
//             child: const Text('ADD'),
//             onPressed: () {
//               Navigator.pop(context);
//               widget.callback(listName);
//             })
//       ],
//     );
//   }
//
//   _handleTextChanged(String newListName) {
//     setState(() {
//       listName = newListName;
//     });
//   }
// }

// class _ViewModel {
//   final OnAddTodoListCallback callback;
//
//   _ViewModel(this.callback);
//
//   static _ViewModel from(Store<AppState> store) => _ViewModel(
//         (listName) => store.dispatch(AddListAction(TodoList(name: listName))),
//       );
// }

typedef OnAddTodoListCallback = Function(String listName);
