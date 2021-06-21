import 'package:flutter/material.dart';

class Mensaje extends StatelessWidget {
  final bool mensajeEnviado;

  Mensaje(this.mensajeEnviado);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      child: Row(
        children: [
          if (!mensajeEnviado)
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://www.peterbe.com/avatar.1.png"),
                ),
              ),
            ),
          if (!mensajeEnviado) Container(width: 5),
          Expanded(
            child: Container(
              child: Wrap(
                alignment:
                    mensajeEnviado ? WrapAlignment.end : WrapAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Theme.of(context).shadowColor,
                          offset: Offset(0, 4),
                          spreadRadius: -10,
                        ),
                      ],
                      color: !mensajeEnviado
                          ? Color(0xFFF3F3F3)
                          : Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Mensaje de prueba probando probando todo el texto jeje',
                      textScaleFactor: 1.3,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
