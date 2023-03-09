import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

import 'connectivity_actions.dart';

final connectivityReducer = combineReducers<bool>(
  [
    TypedReducer<bool, IsConnectedAction>(_onConnected),
    TypedReducer<bool, IsDisconnectedAction>(_onDisconnected),
  ],
);

bool _onConnected(bool state, action) {
  debugPrint('State connectivity was: $state');
  return true;
}

bool _onDisconnected(bool state, action) {
  debugPrint('State connectivity was: $state');
  return false;
}
