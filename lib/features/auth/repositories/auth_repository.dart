import 'package:flutter/material.dart';
import 'package:test_redux/features/auth/models/logged_user_model.dart';
import 'package:test_redux/features/auth/models/login_model.dart';

class AuthRepository {
  Future<LoggedUser?> login(LoginModel model) async {
    debugPrint('Inside login in auth repository');
    return LoggedUser(
      uid: '',
      email: '',
      phoneNumber: '',
      displayName: '',
      photoURL: '',
      emailVerified: false,
      isAnonymous: false,
      idToken: '',
      refreshToken: '',
      fcmToken: '',
      nafazToken: '',
    );
  }
}
