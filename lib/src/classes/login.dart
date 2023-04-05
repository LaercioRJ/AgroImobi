import 'dart:convert';

class Login {
  final String email;
  final String password;

  Login(this.email, this.password);

  toJson() {
    Map<String, dynamic> loginMap = {
      'email': email,
      'password': password,
    };
    String loginJson = jsonEncode(loginMap);
    return loginJson;
  }
}
