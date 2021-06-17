import 'package:proyecto_web/api/api.dart';

class EditUserController {
  const EditUserController();

  static Future<bool> editarUsuario(String email, String password, String nombre, int idPais, int edad, int idGenero, String info) async {
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

    var res = await CallApi().editarUsuario(data, 'editInfo');

    if (res.statusCode >= 400) {
      print("ERROR ${res.statusCode}");
      return Future.value(false);
    } else {
      print("ACTUALIZADO");
      return Future.value(true);
    }
  }
}