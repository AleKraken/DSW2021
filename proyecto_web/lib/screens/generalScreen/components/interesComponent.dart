import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InteresComponent extends StatefulWidget {
  final String nombreInteres;
  final bool estaAgregado;

  InteresComponent(this.nombreInteres, this.estaAgregado);

  @override
  _InteresComponentState createState() =>
      _InteresComponentState(nombreInteres, estaAgregado);
}

class _InteresComponentState extends State<InteresComponent> {
  final String nombreInteres;
  final bool estaAgregado;

  _InteresComponentState(this.nombreInteres, this.estaAgregado);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
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
              child: Text('$nombreInteres'),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(50, 30),
                alignment: Alignment.centerLeft),
            onPressed: () {},
            child: Container(
              width: 45,
              height: 45,
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