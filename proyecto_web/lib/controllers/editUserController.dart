import 'package:proyecto_web/api/api.dart';

class EditUserController {
  const EditUserController();

  static Future<bool> editarUsuario(String info) async {
    var data = {
      'info': info,
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
