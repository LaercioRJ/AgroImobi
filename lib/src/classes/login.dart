class Login {
  final String name;
  final String email;
  final String password;

  const Login(this.email, this.password, this.name);

  toJson() {
    Map<String, dynamic> loginMap = {
      "email": email,
      "senha": password,
      "Nome": name,
    };
    return loginMap;
  }
}
