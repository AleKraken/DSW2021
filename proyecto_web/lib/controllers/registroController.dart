import 'package:proyecto_web/api/api.dart';

class RegistroController {
  const RegistroController();

  static Future<bool> registrarUsuario(String email, String password, String nombre, int idPais, int edad, int idGenero, String info) async {
    var data = {
      'email': email,
      'password': password,
      'nombre': nombre,
      'idPais': idPais,
      'edad': edad,
      'idGenero': idGenero,
      'info': info,
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