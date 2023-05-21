class Broker {
  String Nome;
  String email;
  String senha;
  String telefone;
  String municipio;
  String cpf;
  //String creci;

  Broker(
    this.Nome,
    this.email,
    this.senha,
    this.telefone,
    this.municipio,
    this.cpf,
  );

  toJson() {
    Map<String, dynamic> brokerMap = {
      'email': email,
      'senha': senha,
      'Nome': Nome,
      'telefone': telefone,
      'municipio': municipio,
      'cpf': cpf,
    };
    //String brokerJson = jsonEncode(brokerMap);
    return brokerMap;
  }
}
