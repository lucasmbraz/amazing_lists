import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/presentation/home/home_page.dart';
import 'package:flutter_todo/redux/app_reducer.dart';
import 'package:flutter_todo/redux/app_state.dart';
import "package:redux/redux.dart";

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  Store<AppState> _store;

  @override
  void initState() {
    super.initState();
    _store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
    );
  }

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
