import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_web/controllers/interesController.dart';
import 'package:proyecto_web/models/interes.dart';

class InteresComponent extends StatefulWidget {
  final int idInteres;
  final int index;
  final List<String> listaNombres;
  final List<Interes> listaIntereses;
  final bool estaAgregado;
  final bool soloVista;
  final Function(bool agregar) agregarInteres;

  InteresComponent(
    this.idInteres,
    this.index,
    this.listaNombres,
    this.listaIntereses,
    this.estaAgregado,
    this.soloVista,
    this.agregarInteres(bool agregar),
  );

  @override
  _InteresComponentState createState() => _InteresComponentState(
      idInteres,
      index,
      listaNombres,
      listaIntereses,
      estaAgregado,
      soloVista,
      agregarInteres);
}

class _InteresComponentState extends State<InteresComponent> {
  final int idInteres;
  final int index;
  final List<String> listaNombres;
  final List<Interes> listaIntereses;
  final bool estaAgregado;
  final bool soloVista;
  final Function(bool agregar) agregarInteres;

  _InteresComponentState(
    this.idInteres,
    this.index,
    this.listaNombres,
    this.listaIntereses,
    this.estaAgregado,
    this.soloVista,
    this.agregarInteres(bool agregar),
  );

  String nombreInteres = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("CONSTRUYENDO ID: $idInteres - DE: ${listaNombres[index]}");

    return FadeIn(
      duration: Duration(milliseconds: 130 + (15 * index)),
      child: SlideInUp(
        duration: Duration(milliseconds: 130 + (15 * index)),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
          height: soloVista ? 28 : 42,
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
                    '${listaNombres[index]}',
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
                      child: Container(
                        width: 45,
                        height: soloVista ? 28 : 45,
                        child: Icon(
                          estaAgregado ? MdiIcons.close : MdiIcons.plus,
                          color: estaAgregado ? Colors.red : Colors.blue,
                        ),
                      ),
                      onPressed: () async {
                        estaAgregado
                            ? await InteresController.quitarInteres(idInteres)
                            : await InteresController.agregarInteres(idInteres);

                        setState(() {
                          agregarInteres(!estaAgregado);
                        });
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
