import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_web/controllers/menuController.dart';
import 'package:proyecto_web/screens/components/vistaUsuarioScreen.dart';
import 'package:proyecto_web/screens/main/mainScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InicioScreen extends StatefulWidget {
  InicioScreen({Key key}) : super(key: key);

  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  @override
  Widget build(BuildContext context) {
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
            Wrap(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  itemCount: 20,
                ),
              ],
            ),
          ],
        ),
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
          borderRadius: BorderRadius.circular(4),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Francisco',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '22 años',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(width: 4),
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
              ],
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
