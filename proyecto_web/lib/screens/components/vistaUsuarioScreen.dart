import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_web/responsive.dart';
import 'package:proyecto_web/screens/components/interesComponent.dart';

class VistaUsuario extends StatefulWidget {
  @override
  _VistaUsuarioState createState() => _VistaUsuarioState();
}

class _VistaUsuarioState extends State<VistaUsuario> {
  String nombre = "Paco";
  String apellido = "Gonzáles";
  String pais = "México";
  int edad = 22;

  List<String> interesesActuales = <String>[
    'Ajedrez',
    'Astronomía',
    'Ajedrez',
    'Astronomía',
    'Ajedrez',
    'Astronomía',
  ];

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
                    image: NetworkImage("https://www.peterbe.com/avatar.1.png"),
                  ),
                ),
              ),
              Container(height: 10),
              Text(
                '$nombre $apellido',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Color(0xFF333333)),
              ),
              Container(height: 20),
              Text(
                '$edad años',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Color(0xFF333333)),
              ),
              Container(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$pais',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Color(0xFF333333)),
                  ),
                  Container(width: 7),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        //fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://image.flaticon.com/icons/png/512/3937/3937938.png"),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 22,
              ),
              Text(
                'Intereses:',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Color(0xFF333333)),
              ),
              Container(
                height: getAlturaGrid(interesesActuales.length),
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 25,
                          mainAxisExtent: 40,
                          crossAxisCount: Responsive.isMobile(context)
                              ? 1
                              : Responsive.isTablet(context)
                                  ? 2
                                  : 3,
                        ),
                        itemBuilder: (_, index) => InteresComponent(
                            interesesActuales[index], true, true),
                        itemCount: interesesActuales.length,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(height: 0),
      ],
    );
  }

  double getAlturaGrid(int numeroElementos) {
    double elementosPorLinea;
    if (Responsive.isDesktop(context)) elementosPorLinea = 3.0;
    if (Responsive.isTablet(context)) elementosPorLinea = 2.0;
    if (Responsive.isMobile(context)) elementosPorLinea = 1.0;

    numeroElementos = numeroElementos > 2
        ? numeroElementos ~/ elementosPorLinea
        : numeroElementos;

    return 64.0 * numeroElementos;
  }
}
