import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:proyecto_web/api/api.dart';
import 'package:proyecto_web/models/usuario.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:proyecto_web/sharedPreferences/SPHelper.dart';

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
      //SPHelper.setString('token', res.body['token']);
      print("REGISTRADO con ${SPHelper.getString('token')}");
      return Future.value(true);
    }
  }

  static Future<bool> subirFoto(PickedFile image) async {
    print("INGRESANDO CON TOKEN ${SPHelper.getString('token')}");

    String url = 'http://192.168.100.29:8000/api/subirFotoPerfil';
    var headers = {
      HttpHeaders.contentTypeHeader: "multipart/form-dat",
      HttpHeaders.authorizationHeader: SPHelper.getString('token'),
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    Uint8List data = await image.readAsBytes();
    List<int> list = data.cast();
    request.files.add(http.MultipartFile.fromBytes('your_field_name', list,
        filename: 'myFile.png'));

    var response = await request.send();

    response.stream.bytesToString().asStream().listen((event) {
      var parsedJson = json.decode(event);
      print(parsedJson);
      print(response.statusCode);
    });
    return Future.value(true);
  }
}
