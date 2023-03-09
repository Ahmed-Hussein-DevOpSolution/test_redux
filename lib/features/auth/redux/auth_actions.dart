import 'package:test_redux/features/auth/models/logged_user_model.dart';
import 'package:test_redux/features/auth/models/login_model.dart';

class LoginRequestAction {
  final LoginModel model;

  LoginRequestAction(this.model);
}

class LoginSuccessAction {
  final LoggedUser model;

  LoginSuccessAction(this.model);
}

class LoginErrorAction {
  final Exception model;

  LoginErrorAction(this.model);
}
