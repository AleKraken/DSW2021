import 'dart:convert';

import 'package:proyecto_web/api/api.dart';
import 'package:proyecto_web/sharedPreferences/SPHelper.dart';

class LoginController {
  const LoginController();

  static Future<bool> validarCredenciales(String email, String password) async {
    var data = {
      'email': email,
      'password': password,
    };

    var res = await CallApi().postData(data, 'login');

    var body = await json.decode(res.body);

    if (res.statusCode >= 400) {
      return Future.value(false);
    } else {
      SPHelper.setString('token', body['token']);
      return Future.value(true);
    }
  }
}
