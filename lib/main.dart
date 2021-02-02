import 'package:flutter/material.dart';
import 'package:amazing_lists/redux/store.dart';
import 'package:amazing_lists/amazing_lists_app.dart';

void main() {
  final store = createReduxStore();
  runApp(AmazingListsApp(store));
}
