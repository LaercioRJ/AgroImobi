import 'package:helloworld/src/classes/user.dart';
import 'package:http/http.dart' as http;

import '../classes/login.dart';
import 'dart:convert';

class ServerInterface {
  Future<bool> sendingInformation(url, body) async {
    try {
      await http.post(Uri.parse(url), body: body).then((result) {
        if (result.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      });
    } catch (exception) {
      print(exception);
      return false;
    }
    return false;
  }

  Future<bool> verifyInformation(url, body) async {
    try {
      var result = await http.get(Uri.parse(url));
      final data = jsonDecode(result.body);

      if (result.statusCode == 200) {
        return body['senha'] == data['response'][0]['senha'];
      }
    } catch (exception) {
      print(exception);
      return false;
    }
    return false;
  }
}
