import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_web/controllers/interesController.dart';
import 'package:proyecto_web/models/interes.dart';
import 'package:proyecto_web/models/usuario.dart';
import 'package:proyecto_web/responsive.dart';
import 'package:proyecto_web/screens/components/interesComponent.dart';

class VistaUsuario extends StatefulWidget {
  final Usuario usuario;
  final String pais;
  final String genero;

  VistaUsuario(this.usuario, this.pais, this.genero);

  @override
  _VistaUsuarioState createState() => _VistaUsuarioState(usuario, pais, genero);
}

class _VistaUsuarioState extends State<VistaUsuario> {
  final Usuario usuario;
  final String pais;
  final String genero;

  _VistaUsuarioState(this.usuario, this.pais, this.genero);

  List<String> intereses = <String>[];

  Future _futureIntereses;

  @override
  void initState() {
    _futureIntereses = getIntereses();
    super.initState();
  }

  Future getIntereses() async {
    List<Interes> listaIntereses = await InteresController.getIntereses();
    List<InteresUsuario> listaInteresesUsuario =
        await InteresController.getInteresesPorUsuario(usuario.id);

    listaIntereses.forEach((interes) {
      listaInteresesUsuario.forEach((interesUsuario) {
        if (interes.id == int.parse(interesUsuario.idInteres)) {
          intereses.add(interes.nomInteres);
        }
      });
    });

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 80,
          constraints: BoxConstraints(
            maxWidth: 700,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      MdiIcons.messageReplyText,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(MdiIcons.close),
                  ),
                ],
              ),
              Container(
                height: 105,
                width: 105,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.peterbe.com/avatar.${usuario.id}.png"),
                  ),
                ),
              ),
              Container(height: 10),
              Text(
                '${usuario.nombre},  ${usuario.edad} años',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Color(0xFF333333)),
              ),
              Container(height: 10),
              Text(
                '${usuario.info}',
                style: Theme.of(context).textTheme.subtitle2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                textScaleFactor: 1.2,
              ),
              Container(height: 28),
              Text(
                '$pais',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Color(0xFF333333)),
              ),
              Container(
                height: 10,
              ),
              Text(
                'Género: $genero',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Color(0xFF333333)),
              ),
              Container(height: 30),
              Text(
                'Intereses:',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Color(0xFF333333)),
              ),
              Container(height: 12),
              FutureBuilder(
                  future: _futureIntereses,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return intereses.length > 0
                          ? Container(
                              height: getAlturaGrid(intereses.length),
                              child: SingleChildScrollView(
                                child: Wrap(
                                  children: [
                                    GridView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 3),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 30,
                                        mainAxisSpacing: 25,
                                        mainAxisExtent: 40,
                                        crossAxisCount:
                                            Responsive.isMobile(context)
                                                ? 1
                                                : Responsive.isTablet(context)
                                                    ? 2
                                                    : 3,
                                      ),
                                      itemBuilder: (_, index) =>
                                          InteresComponent(
                                        index,
                                        index,
                                        intereses,
                                        <Interes>[],
                                        true,
                                        true,
                                        (bool valor) {},
                                      ),
                                      itemCount: intereses.length,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://image.flaticon.com/icons/png/512/4076/4076549.png"),
                                      ),
                                    ),
                                  ),
                                  Container(width: 25),
                                  Text(
                                    'Parece que este usuario aún no tiene intereses',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                            );
                    }
                  }),
              Container(height: 0),
            ],
          ),
        ),
      ],
    );
  }

  double getAlturaGrid(int numeroElementos) {
    double elementosPorLinea;
    if (Responsive.isDesktop(context)) elementosPorLinea = 3.0;
    if (Responsive.isTablet(context)) elementosPorLinea = 2.0;
    if (Responsive.isMobile(context)) elementosPorLinea = 1.0;

    int lineas = numeroElementos ~/ elementosPorLinea;

    lineas += (numeroElementos % elementosPorLinea == 0) ? 0 : 1;

    return 64.0 * lineas;
  }
}
