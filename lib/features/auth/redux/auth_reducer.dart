import 'package:redux/redux.dart';
import 'package:test_redux/features/auth/models/logged_user_model.dart';

import 'auth_actions.dart';

final authReducer = combineReducers<LoggedUser?>([
  TypedReducer<LoggedUser?, LoginSuccessAction>(_onUserLoggedIn),
  TypedReducer<LoggedUser?, LoginErrorAction>(_onUserLogInError),
]);

LoggedUser? _onUserLoggedIn(LoggedUser? state, LoginSuccessAction action) {
  return action.model;
}

LoggedUser? _onUserLogInError(LoggedUser? state, LoginErrorAction action) {
  return null;
}
