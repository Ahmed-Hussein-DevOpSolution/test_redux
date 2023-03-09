class LoggedUser {
  String uid;
  String email;
  String phoneNumber;
  String displayName;
  String photoURL;

  bool emailVerified;
  bool isAnonymous;

  String idToken;
  String refreshToken;
  String fcmToken;

  String nafazToken;

  LoggedUser({
    required this.uid,
    required this.email,
    required this.phoneNumber,
    required this.displayName,
    required this.photoURL,
    required this.emailVerified,
    required this.isAnonymous,
    required this.idToken,
    required this.refreshToken,
    required this.fcmToken,
    required this.nafazToken,
  });

  LoggedUser.fromJson(Map<String, dynamic> json)
      : this(
          uid: json['uid'],
          email: json['email'],
          phoneNumber: json['phoneNumber'],
          displayName: json['displayName'],
          photoURL: json['photoURL'],
          emailVerified: json['emailVerified'],
          isAnonymous: json['isAnonymous'],
          idToken: json['idToken'],
          refreshToken: json['refreshToken'],
          fcmToken: json['fcmToken'],
          nafazToken: json['nafazToken'],
        );

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'phoneNumber': phoneNumber,
      'displayName': displayName,
      'photoURL': photoURL,
      'emailVerified': emailVerified,
      'isAnonymous': isAnonymous,
      'idToken': idToken,
      'refreshToken': refreshToken,
      'fcmToken': fcmToken,
      'nafazToken': nafazToken,
    };
  }

  @override
  String toString() {
    return '''LoggedUser: uid: $uid,
    email: $email,
    phoneNumber: $phoneNumber,
    displayName: $displayName,
    photoURL: $photoURL,
    emailVerified: $emailVerified,
    isAnonymous: $isAnonymous,
    idToken: $idToken,
    refreshToken: $refreshToken,
    fcmToken: $fcmToken,
    nafazToken: $nafazToken''';
  }
}
