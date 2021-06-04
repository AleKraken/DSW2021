import 'dart:convert';

import 'package:proyecto_web/api/api.dart';
import 'package:proyecto_web/models/interes.dart';

class InteresController {
  const InteresController();

  static Future<List<Interes>> getInteresesPorUsuario(int idInteres) async {
    var res = await CallApi().getData('getInteresesUsuario/$idInteres');

    Iterable iterable = json.decode(res.body);
    List<Interes> intereses =
        List<Interes>.from(iterable.map((model) => Interes.fromJson(model)));

    return Future.value(intereses);
  }
}
