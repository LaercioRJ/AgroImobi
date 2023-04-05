import 'dart:convert';

class Broker {

  String name;
  String email;
  String password;
  String cellphone;
  String creci;

  Broker(this.name, this.email, this.password, this.cellphone, this.creci);

  toJson() {
    Map<String, dynamic> brokerMap = {
      'name': name,
      'email': email,
      'password': password,
      'cellphone': cellphone,
      'CRECI': creci,
    };
    String brokerJson = jsonEncode(brokerMap);
    return brokerJson;
  }
}
