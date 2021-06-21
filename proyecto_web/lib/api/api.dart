import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proyecto_web/sharedPreferences/SPHelper.dart';

class CallApi {
  final String _url = 'http://192.168.100.29:8000/api/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: await _getToken(),
      },
    );
  }

  registrar(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
  }

  subirFoto(data, apiUrl) async {
    var fullUrl = _url + apiUrl;

    return await http.post(
      Uri.parse(fullUrl),
      body: data,
      headers: {
        HttpHeaders.contentTypeHeader: "multipart/form-dat",
        HttpHeaders.authorizationHeader: await _getToken(),
      },
    );
  }

  editarUsuario(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.put(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: await _getToken(),
      },
    );
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(
      Uri.parse(fullUrl),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: _getToken()
      },
    );
  }

  _getToken() {
    return 'Bearer ${SPHelper.getString('token')}';
  }
}
