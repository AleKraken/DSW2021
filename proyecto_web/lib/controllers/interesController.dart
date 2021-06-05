import 'dart:convert';

import 'package:proyecto_web/api/api.dart';
import 'package:proyecto_web/models/interes.dart';

class InteresController {
  const InteresController();

  static Future<List<InteresUsuario>> getInteresesPorUsuario(
      int idUsuario) async {
    var res = await CallApi().getData('getInteresesUsuario/$idUsuario');

    Iterable iterable = json.decode(res.body);
    List<InteresUsuario> interesesUsuario = List<InteresUsuario>.from(
        iterable.map((model) => InteresUsuario.fromJson(model)));

    return Future.value(interesesUsuario);
  }

  static Future<List<Interes>> getIntereses() async {
    var res = await CallApi().getData('getListaInteres');

    Iterable iterable = json.decode(res.body);
    List<Interes> intereses =
        List<Interes>.from(iterable.map((model) => Interes.fromJson(model)));

    print(res.body);

    return Future.value(intereses);
  }

  static Future<List<InteresUsuario>> getMisIntereses() async {
    var res = await CallApi().getData('misIntereses');

    Iterable iterable = json.decode(res.body);
    List<InteresUsuario> misIntereses = List<InteresUsuario>.from(
        iterable.map((model) => InteresUsuario.fromJson(model)));

    return Future.value(misIntereses);
  }

  static Future<InteresUsuario> getLastInteres() async {
    var res = await CallApi().getData('misIntereses');

    Iterable iterable = json.decode(res.body);
    List<InteresUsuario> misIntereses = List<InteresUsuario>.from(
        iterable.map((model) => InteresUsuario.fromJson(model)));

    return Future.value(misIntereses.last);
  }

  static Future<bool> agregarInteres(int idInteres) async {
    var res = await CallApi().postData({}, 'agegarInteres/$idInteres');

    if (res.statusCode >= 400) {
      print("ERROR ${res.statusCode}");
      return Future.value(false);
    } else {
      print("INTERES $idInteres AGREGADO");
      return Future.value(true);
    }
  }

  static Future<bool> quitarInteres(int idInteres) async {
    var res = await CallApi().deleteData('eliminarInteres/$idInteres');

    if (res.statusCode >= 400) {
      print("ERROR ${res.statusCode}");
      return Future.value(false);
    } else {
      print("INTERES $idInteres QUITADO");
      return Future.value(true);
    }
  }
}
