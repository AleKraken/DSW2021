import 'package:flutter/material.dart';
import 'package:proyecto_web/responsive.dart';
import 'package:proyecto_web/screens/components/interesComponent.dart';

class InteresesScreen extends StatefulWidget {
  InteresesScreen({Key key}) : super(key: key);

  @override
  _InteresesScreenState createState() => _InteresesScreenState();
}

class _InteresesScreenState extends State<InteresesScreen> {
  List<String> interesesActuales = <String>[
    'Ajedrez',
    'Astronomía',
    'Boxeo',
    'Cine',
    'Videojuegos',
    'Ciencia',
    'Cine',
    'Videojuegos',
    'Ciencia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(MediaQuery.of(context).size.width / 40),
          /*
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Theme.of(context).shadowColor,
                offset: Offset(0, 3),
                spreadRadius: 0,
              ),
            ],
          ),
          */
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Tus intereses',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Container(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20),
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
                  itemBuilder: (_, index) =>
                      InteresComponent(interesesActuales[index], true),
                  itemCount: interesesActuales.length,
                ),
                Container(height: 40),
                Text(
                  'Agrega más intereses',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Container(height: 10),
                Text(
                  'Los intereses te ayudarán a encontrar gente más fácilmente. ¡Elige tus favoritos!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Container(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20),
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
                  itemBuilder: (_, index) =>
                      InteresComponent(interesesActuales[index], false),
                  itemCount: interesesActuales.length,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 80,
                      child: TextButton(
                        child: Text(
                          'Ver todos',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
