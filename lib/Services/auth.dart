import 'package:http/http.dart' as http;
import 'package:scmes_lite/helper/base_url.dart';

class AuthService {
  var loginUri = Uri.parse('${Constants.BASE_URL}/Login');

  Future<http.Response?> login(String jsonText) async {
    var res = await http.post(
      loginUri,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "json": jsonText,
      },
    );
    print('AuthService | ${res.statusCode}');
    print('AuthService | ${res.body}');
    return res;
  }
}
