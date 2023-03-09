import 'package:flutter/material.dart';
import 'package:test_redux/features/auth/models/logged_user_model.dart';
import 'package:test_redux/features/auth/models/login_model.dart';

class AuthRepository {
  Future<LoggedUser?> login(LoginModel model) async {
    debugPrint('Inside login in auth repository');
    return LoggedUser(
      uid: '',
      email: '',
      phoneNumber: '+2012',
      displayName: 'Ahmed',
      photoURL: '',
      emailVerified: false,
      isAnonymous: false,
      idToken: 'xdfvsdf',
      refreshToken: '',
      fcmToken: '',
      nafazToken: '',
    );
  }
}
