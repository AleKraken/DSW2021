import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class PerfilUsuario extends StatefulWidget {
  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  final List<TextEditingController> listaControladores =
      <TextEditingController>[];
  final List<FocusNode> listaFocus = <FocusNode>[];

  bool validando = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 7; i++) {
      listaControladores.add(new TextEditingController());
      listaFocus.add(new FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 20),
                Container(
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
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
                  width: MediaQuery.of(context).size.width - 80,
                  constraints: BoxConstraints(
                    maxWidth: 700,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 105,
                        width: 105,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://www.peterbe.com/avatar.1.png"),
                          ),
                        ),
                      ),
                      Container(height: 10),
                      Text(
                        'Alejandro Ortega',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Color(0xFF333333)),
                      ),
                      Container(height: 50),
                      Container(
                        width: 400,
                        alignment: Alignment.center,
                        child: textField(listaControladores[0], 0, context,
                            'Usuario', '', false, 0, MdiIcons.account),
                      ),
                      Container(
                        width: 400,
                        alignment: Alignment.center,
                        child: textField(listaControladores[1], 1, context,
                            'Correo', '', false, 0, MdiIcons.account),
                      ),
                      Container(
                        width: 400,
                        alignment: Alignment.center,
                        child: textField(listaControladores[2], 2, context,
                            'Nombre', '', false, 0, MdiIcons.account),
                      ),
                      Container(
                        width: 400,
                        alignment: Alignment.center,
                        child: textField(listaControladores[3], 3, context,
                            'Apellido', '', false, 0, MdiIcons.account),
                      ),
                      Container(
                        width: 400,
                        alignment: Alignment.center,
                        child: textField(listaControladores[4], 4, context,
                            'País', '', false, 0, MdiIcons.account),
                      ),
                      Container(
                        width: 400,
                        alignment: Alignment.center,
                        child: textField(listaControladores[5], 5, context,
                            'Edad', '', false, 0, MdiIcons.account),
                      ),
                      Container(
                        width: 400,
                        alignment: Alignment.center,
                        child: textField(listaControladores[6], 6, context,
                            'Contraseña', '', false, 0, MdiIcons.account),
                      ),
                      Container(height: 20),
                      Container(
                        width: 300,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(.15),
                          ),
                          onPressed: () {},
                          child: Text('Guardar cambios'),
                        ),
                      ),
                      Container(height: 15),
                    ],
                  ),
                ),
                Container(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField(
      TextEditingController controlador,
      int index,
      context,
      String textoLabel,
      String textoHint,
      bool esClave,
      int limiteCampo,
      IconData icono) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Stack(
        children: [
          Container(
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              keyboardType: TextInputType.text,
              obscureText: esClave ? true : false,
              controller: controlador,
              textAlign: TextAlign.left,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 1,
              maxLength: limiteCampo < 1 ? null : limiteCampo,
              cursorColor: Theme.of(context).iconTheme.color,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                border: new OutlineInputBorder(),
                prefixIcon: Icon(icono),
                hintStyle: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Color(0xFF333333)),
                labelText: "$textoLabel",
                hintText: "$textoHint",
                contentPadding: EdgeInsets.all(20),
                labelStyle: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Color(0xFF333333)),
              ),
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Color(0xFF333333),
                    fontSize: esClave ? 20 : null,
                  ),
              focusNode: listaFocus[index],
              onSubmitted: (texto) {
                if (index < listaControladores.length - 1) {
                  FocusScope.of(context).requestFocus(listaFocus[index + 1]);
                } else {
                  FocusScope.of(context).unfocus();
                }
              },
              onChanged: (texto) {},
            ),
          ),
        ],
      ),
    );
  }
}
