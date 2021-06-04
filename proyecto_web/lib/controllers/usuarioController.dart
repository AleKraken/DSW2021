import 'dart:async';
import 'dart:convert';
import 'package:proyecto_web/api/api.dart';
import 'package:proyecto_web/models/genero.dart';
import 'package:proyecto_web/models/pais.dart';
import 'package:proyecto_web/models/usuario.dart';

class UsuarioController {
  const UsuarioController();

  static Future<List<Pais>> getPaises() async {
    var res = await CallApi().getData('getListaPais');

    Iterable iterable = json.decode(res.body);
    List<Pais> paises =
        List<Pais>.from(iterable.map((model) => Pais.fromJson(model)));
    return Future.value(paises);
  }

  static Future<List<Genero>> getGeneros() async {
    var res = await CallApi().getData('getListaGenero');

    Iterable iterable = json.decode(res.body);
    List<Genero> generos =
        List<Genero>.from(iterable.map((model) => Genero.fromJson(model)));

    return Future.value(generos);
  }

  static Future<List<Usuario>> getUsuarios() async {
    var res = await CallApi().getData('getUsuariosRecomendados');

    Iterable iterable = json.decode(res.body);
    List<Usuario> usuarios =
        List<Usuario>.from(iterable.map((model) => Usuario.fromJson(model)));

    return Future.value(usuarios);
  }

  static Future<Usuario> getInfoPersonal() async {
    var res = await CallApi().getData('getInfoPersonal');

    Map<String, dynamic> usuarioMap = await jsonDecode(res.body);
    Usuario usuario = Usuario.fromJson(usuarioMap);

    print(usuario.nombre);

    return Future.value(usuario);
  }
}
