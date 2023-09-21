class Broker {
  String name;
  String email;
  String password;
  String cellphone;
  String city;
  String cpf;
  //String creci;

  Broker(
    this.name,
    this.email,
    this.password,
    this.cellphone,
    this.city,
    this.cpf,
  );

  toJson() {
    Map<String, dynamic> brokerMap = {
      'email': email,
      'senha': password,
      'Nome': name,
      'telefone': cellphone,
      'municipio': city,
      'cpf': cpf,
    };
    //String brokerJson = jsonEncode(brokerMap);
    return brokerMap;
  }
}
