import 'package:flutter_todo/redux/app_state.dart';
import 'package:flutter_todo/redux/reducers.dart';
import 'package:redux/redux.dart';

Store<AppState> createReduxStore() => Store<AppState>(
      appReducer,
      initialState: AppState.init(),
    );
