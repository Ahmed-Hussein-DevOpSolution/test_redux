import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

import '../features/auth/redux/auth_actions.dart';

final loadingReducer = combineReducers<bool>(
  [
    // Start loading
    TypedReducer<bool, LoginRequestAction>(_setLoading),

    // Stop loading
    TypedReducer<bool, LoginSuccessAction>(_setLoaded),
    TypedReducer<bool, LoginErrorAction>(_setLoaded),
  ],
);

bool _setLoaded(bool state, action) {
  debugPrint('Set loading false');
  return false;
}

bool _setLoading(bool state, action) {
  debugPrint('Set loading true');
  return true;
}
