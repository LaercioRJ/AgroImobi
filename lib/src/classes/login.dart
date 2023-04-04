import 'dart:convert';
import 'package:http/http.dart' as http;

class Login {
  toJson(String email, String password) {
    Map<String, dynamic> loginMap = {
      'email': email,
      'password': password,
    };
    String loginJson = jsonEncode(loginMap);
    sendJson(loginJson);
  }

  Future sendJson(String json) async {
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