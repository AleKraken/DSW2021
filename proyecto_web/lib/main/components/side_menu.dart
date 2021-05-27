import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final int id;
  final seleccionadoActual;
  final String title;
  final String iconRoute;
  final VoidCallback press;

  const DrawerListTile(
      this.id, this.seleccionadoActual, this.title, this.iconRoute, this.press);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor:
          seleccionadoActual == id ? Colors.black.withOpacity(.15) : null,
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Container(
        margin: EdgeInsets.only(top: 2),
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("$iconRoute"),
          ),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
