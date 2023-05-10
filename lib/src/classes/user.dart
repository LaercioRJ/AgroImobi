import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class User {
  final String name;
  final String email;
  final String password;

  User(this.name, this.email, this.password);

  toJson() {
    Map<String, dynamic> userMap = {
      "email": email,
      "senha": password,
      "Nome": name,
    };
    return userMap;
  }
}
