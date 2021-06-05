import 'package:proyecto_web/api/api.dart';
import 'package:proyecto_web/models/usuario.dart';

class RegistroController {
  const RegistroController();

  static Future<bool> registrarUsuario(Usuario usuario) async {
    var data = {
      'email': usuario.email,
      'password': usuario.password,
      'nombre': usuario.nombre,
      'idPais': usuario.idPais,
      'edad': usuario.edad,
      'idGenero': usuario.idGenero,
      'info': usuario.info,
      'rutaFoto': null,
    };

    var res = await CallApi().registrar(data, 'register');

    if (res.statusCode >= 400) {
      print("ERROR ${res.statusCode}");
      return Future.value(false);
    } else {
      print("REGISTRADO");
      return Future.value(true);
    }
  }
}
