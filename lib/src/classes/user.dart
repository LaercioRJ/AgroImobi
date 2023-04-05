import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);

  toJson() {
    Map<String, dynamic> userMap = {
      'nome': name,
      'email': email,
      'password': password,
    };
    String userJson = jsonEncode(userMap);
    return userJson;
  }
}
