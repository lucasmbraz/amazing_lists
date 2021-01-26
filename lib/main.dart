import 'package:flutter/material.dart';
import 'package:amazing_lists/redux/store.dart';
import 'package:amazing_lists/todo_app.dart';

void main() {
  final store = createReduxStore();
  runApp(TodoApp(store));
}
