
import 'package:redux/redux.dart';
import 'dart:async';

import 'package:wanderwagon/redux/app/app_state.dart';
import 'package:wanderwagon/redux/app/app_reducer.dart';

Future<Store<AppState>> createStore() async {

  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: []
  );

}