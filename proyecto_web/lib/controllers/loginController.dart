import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_web/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  const LoginController();

  static Future<bool> validarCredenciales(String email, String password) async {
    var data = {
      'email': email,
      'password': password,
    };

    var res = await CallApi().postData(data, 'login');
    print("RESPUESTA ${res.body}");
    return Future.value(false);

    //var body = json.decode(res.body);

    /*
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));
      print("SÍ SE PUDO");
      return Future.value(true);
    } else {
      print("NO SE PUDO");
      return Future.value(false);
    }

    */
  }
}
