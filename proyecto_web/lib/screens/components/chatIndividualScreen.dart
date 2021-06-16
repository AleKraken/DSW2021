import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_web/screens/components/mensaje.dart';

class ChatIndividual extends StatefulWidget {
  @override
  _ChatIndividualState createState() => _ChatIndividualState();
}

class _ChatIndividualState extends State<ChatIndividual> {
  TextEditingController textController = new TextEditingController();
  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    focusNode.unfocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        children: [
          barraSuperior(),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height - 90,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Mensaje(true),
                        Mensaje(false),
                        Mensaje(true),
                        Mensaje(false),
                        Mensaje(true),
                        Mensaje(false),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          barraInferior(),
        ],
      ),
    );
  }

  Widget barraSuperior() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Theme.of(context).shadowColor,
            offset: Offset(-3, 0),
            spreadRadius: -8,
          ),
        ],
        color: Theme.of(context).backgroundColor,
      ),
      height: 40,
      child: Text(
        'Francisco Villa',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget barraInferior() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Theme.of(context).shadowColor,
            offset: Offset(-3, 0),
            spreadRadius: -8,
          ),
        ],
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: textField(context, 'Escribe un mensaje',
                'Escribe un mensaje', 0, MdiIcons.chat),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              height: 50,
              child: Icon(MdiIcons.send),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(context, String textoLabel, String textoHint,
      int limiteCampo, IconData icono) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: textController,
        textAlign: TextAlign.left,
        textCapitalization: TextCapitalization.sentences,
        maxLines: 1,
        maxLength: limiteCampo < 1 ? null : limiteCampo,
        cursorColor: Theme.of(context).iconTheme.color,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          prefixIcon: Icon(icono),
          hintStyle:
              Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 13),
          hintText: "$textoHint",
          contentPadding: EdgeInsets.all(17.3),
          labelStyle: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Color(0xFF333333)),
        ),
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Color(0xFF333333),
            ),
        focusNode: focusNode,
        onSubmitted: (texto) {
          FocusScope.of(context).unfocus();
        },
        onChanged: (texto) {},
      ),
    );
  }
}
