import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:test_redux/features/auth/redux/auth_actions.dart';

import '../../../app_redux/app_state.dart';
import '../repositories/auth_repository.dart';

List<Middleware<AppState>> createAuthsMiddleware(
  AuthRepository repository,
) {
  return [
    TypedMiddleware<AppState, LoginRequestAction>(_loginMiddleware(repository)),
  ];
}

void Function(
  Store<AppState> store,
  LoginRequestAction action,
  NextDispatcher next,
) _loginMiddleware(
  AuthRepository repository,
) {
  debugPrint('Inside _loginMiddleware in auth middleware');
  return (Store<AppState> store, LoginRequestAction action,
      NextDispatcher next) {
    repository.login(action.model).then(
      (response) {
        debugPrint(
            'Inside then after response: $response repository login in auth middleware');
        if (response == null) {
          store.dispatch(LoginErrorAction(Exception('User does not exist.')));
          return;
        } else {
          store.dispatch(LoginSuccessAction(response));
        }
      },
    ).catchError((_) => store.dispatch(LoginErrorAction(_)));

    next(action);
  };
}
