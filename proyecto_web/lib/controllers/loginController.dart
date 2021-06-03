import 'dart:convert';

import 'package:proyecto_web/api/api.dart';
import 'package:proyecto_web/models/usuario.dart';
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

  static Future<Usuario> getInfoPersonal() async {
    var res = await CallApi().getData('getInfoPersonal');

    Map<String, dynamic> usuarioMap = await jsonDecode(res.body);
    Usuario usuario = Usuario.fromJson(usuarioMap);

    print(usuario.nombre);

    return Future.value(usuario);
  }
}
