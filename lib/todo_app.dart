import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/home/home_page.dart';
import 'package:flutter_todo/redux/app_state.dart';
import 'package:redux/redux.dart';

class TodoApp extends StatelessWidget {
  final Store<AppState> _store;

  const TodoApp(this._store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
