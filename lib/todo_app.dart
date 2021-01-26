import 'package:amazing_lists/brand.dart';
import 'package:amazing_lists/home/home_page.dart';
import 'package:amazing_lists/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TodoApp extends StatelessWidget {
  final Store<AppState> _store;

  const TodoApp(this._store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'Amazing Lists',
        theme: brandTheme,
        home: HomePage(),
      ),
    );
  }
}
