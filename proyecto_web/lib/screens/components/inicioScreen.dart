import 'package:flutter/material.dart';
import 'package:proyecto_web/controllers/usuarioController.dart';
import 'package:proyecto_web/models/genero.dart';
import 'package:proyecto_web/models/pais.dart';
import 'package:proyecto_web/models/usuario.dart';
import 'package:proyecto_web/screens/components/vistaUsuarioScreen.dart';

class InicioScreen extends StatefulWidget {
  final Usuario usuarioActual;
  InicioScreen(this.usuarioActual);

  @override
  _InicioScreenState createState() => _InicioScreenState(usuarioActual);
}

class _InicioScreenState extends State<InicioScreen> {
  final Usuario usuarioActual;
  _InicioScreenState(this.usuarioActual);

  Future _futureUsuarios;

  List<Usuario> usuarios;
  List<String> paisUsuarios = <String>[];
  List<String> generoUsuarios = <String>[];

  @override
  void initState() {
    _futureUsuarios = getUsuarios();
    super.initState();
  }

  Future getUsuarios() async {
    usuarios = await UsuarioController.getUsuarios();
    List<Genero> listaGeneros = await UsuarioController.getGeneros();
    List<Pais> listaPaises = await UsuarioController.getPaises();

    usuarios.removeWhere((usuario) => usuario.id == usuarioActual.id);

    usuarios.forEach((usuario) {
      Pais pais = listaPaises
          .firstWhere((pais) => pais.id == int.parse(usuario.idPais));
      if (pais != null) {
        paisUsuarios.add(pais.nomPais);
      } else {
        paisUsuarios.add('');
      }

      Genero genero = listaGeneros
          .firstWhere((genero) => genero.id == int.parse(usuario.idGenero));
      if (genero != null) {
        generoUsuarios.add(genero.nomGenero);
      } else {
        generoUsuarios.add('');
      }
      Future.delayed(Duration.zero);
    });

    return Future.value(usuarios);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: FutureBuilder(
            future: _futureUsuarios,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  children: [
                    Container(height: 65),
                    Text(
                      '¿Listo para crear nuevas amistades?',
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                    Container(height: 40),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF26A3D7),
                          elevation: 10,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 30),
                          alignment: Alignment.centerLeft),
                      child: Text(
                        'Encontrar a alguien',
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {},
                    ),
                    Container(height: 80),
                    Text(
                      'También te recomendamos hablar con...',
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                      textScaleFactor: .86,
                    ),
                    Container(height: 40),
                    Wrap(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(15),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            crossAxisSpacing: 45,
                            mainAxisSpacing: 0,
                            mainAxisExtent: 170,
                            crossAxisCount:
                                (MediaQuery.of(context).size.width ~/ 290) < 1
                                    ? 1
                                    : MediaQuery.of(context).size.width ~/ 290,
                          ),
                          itemBuilder: (_, index) => cardPersona(index),
                          itemCount: usuarios.length,
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }

  Widget cardPersona(int index) {
    return TextButton(
      onPressed: () {
        mostrarVistaUsuario(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.only(bottom: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              color: Theme.of(context).shadowColor,
              offset: Offset(0, 3),
              spreadRadius: -2,
            ),
          ],
          color: Theme.of(context).primaryColorLight,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 125,
              width: 125,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage("https://www.peterbe.com/avatar.$index.png"),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${usuarios[index].nombre}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${usuarios[index].edad}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${paisUsuarios[index]}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  mostrarVistaUsuario(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Builder(builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              clipBehavior: Clip.antiAlias,
              children: [
                VistaUsuario(),
              ],
            ),
          );
        }),
      ),
    );
  }
}
