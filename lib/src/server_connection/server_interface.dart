//import 'package:http/http.dart' as http;

class ServerInterface {

  Future<bool> verifyInformation(url, body) async {
    return true;
    /*try {
      http.post(Uri.parse(url), body: body).then((result) {
        if (result.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      });
    } catch(exception) {
      print(exception);
      return false;
    }
    return false;*/
  }

  Future<String> registerInformation(url, body) async {
    return 'completed';
  }
}