class LoginModel {
  String password;
  String userName;

  LoginModel({
    required this.userName,
    required this.password,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : this(
          userName: json['userName'],
          password: json['password'],
        );

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'password': password,
    };
  }
}
