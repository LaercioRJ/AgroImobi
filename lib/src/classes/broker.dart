import 'dart:convert';
import 'package:http/http.dart' as http;

class Broker {
  void toJson(String nome, String email, String password, String telefone,
      String CRECI) {
    Map<String, dynamic> BrokerMap = {
      'nome': nome,
      'email': email,
      'password': password,
      'telefone': telefone,
      'CRECI': CRECI,
    };
    String BrokerJson = jsonEncode(BrokerMap);
    sendJson(BrokerJson);
  }

  Future<void> sendJson(String json) async {
    try {
      print(json);
      /*final result = await http.post(Uri.parse('url da api'), body: json);
      if (result.statusCode == 200) {
        String response = result.body;
        if (response == 'sucesso') {
          //aqui chama a rota da segunda tela
        } else {
          print('Usuario nao encontrado');
        }
      }*/
    } catch (e) {
      print(e);
    }
  }
}
