import 'package:amazing_lists/redux/app_state.dart';
import 'package:amazing_lists/redux/reducers.dart';
import 'package:redux/redux.dart';

Store<AppState> createReduxStore() => Store<AppState>(
      appReducer,
      initialState: AppState.init(),
    );
