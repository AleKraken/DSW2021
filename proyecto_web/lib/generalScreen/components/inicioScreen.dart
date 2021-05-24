import 'package:flutter/material.dart';
import 'package:proyecto_web/responsive.dart';

class InicioScreen extends StatefulWidget {
  InicioScreen({Key key}) : super(key: key);

  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  @override
  Widget build(BuildContext context) {
    final double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;

    return SingleChildScrollView(
      child: Container(
        child: Column(
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
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
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
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisSpacing: 45,
                mainAxisSpacing: 0,
                mainAxisExtent: 210,
                crossAxisCount: (MediaQuery.of(context).size.width ~/ 240) < 1
                    ? 1
                    : MediaQuery.of(context).size.width ~/ 240,
              ),
              itemBuilder: (_, index) => cardPersona(),
              itemCount: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget cardPersona() {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 13,
                  color: Colors.black,
                  offset: Offset(0, 3),
                  spreadRadius: -4,
                ),
              ],
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://cdn4.iconfinder.com/data/icons/business-square-gradient-shadow-2/512/xxx012-512.png"),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'César Fajardo',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.2,
                  ),
                ),
                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://image.flaticon.com/icons/png/128/552/552486.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5, left: 5),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '3 Intereses en común',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
