import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InteresComponent extends StatefulWidget {
  final String nombreInteres;
  final bool estaAgregado;
  final bool soloVista;

  InteresComponent(this.nombreInteres, this.estaAgregado, this.soloVista);

  @override
  _InteresComponentState createState() =>
      _InteresComponentState(nombreInteres, estaAgregado, soloVista);
}

class _InteresComponentState extends State<InteresComponent> {
  final String nombreInteres;
  final bool estaAgregado;
  final bool soloVista;

  _InteresComponentState(this.nombreInteres, this.estaAgregado, this.soloVista);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: soloVista ? 28 : 45,
      width: 150,
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
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '$nombreInteres',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          soloVista
              ? Container()
              : TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, soloVista ? 20 : 30),
                      alignment: Alignment.centerLeft),
                  onPressed: () {},
                  child: Container(
                    width: 45,
                    height: soloVista ? 28 : 45,
                    child: Icon(
                      estaAgregado ? MdiIcons.close : MdiIcons.plus,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
