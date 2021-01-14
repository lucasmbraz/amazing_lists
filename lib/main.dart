import 'package:flutter/material.dart';
import 'package:flutter_todo/redux/store.dart';
import 'package:flutter_todo/todo_app.dart';

void main() {
  final store = createReduxStore();
  runApp(TodoApp(store));
}
