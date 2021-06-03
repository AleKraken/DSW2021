import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_web/models/usuario.dart';

class PerfilUsuario extends StatefulWidget {
  final Usuario usuario;
  PerfilUsuario(this.usuario);

  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState(usuario);
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  final Usuario usuario;
  _PerfilUsuarioState(this.usuario);

  final List<TextEditingController> listaControladores =
      <TextEditingController>[];
  final List<FocusNode> listaFocus = <FocusNode>[];

  bool validando = false;

  @override
  void initState() {
    super.initState();
    listaControladores.add(new TextEditingController(text: usuario.info));
    listaFocus.add(new FocusNode());
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
                        '${usuario.nombre}',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Color(0xFF333333)),
                      ),
                      Container(height: 50),
                      Container(
                        width: 400,
                        alignment: Alignment.center,
                        child: textField(listaControladores[0], 0, context, '',
                            'Info', false, 0, MdiIcons.account),
                      ),
                      Container(height: 20),
                      Text('Correo: ${usuario.email}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.bold)),
                      Container(height: 20),
                      Text('País: ${usuario.idPais}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.bold)),
                      Container(height: 20),
                      Text(
                        'Edad: ${usuario.edad}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(height: 20),
                      Text(
                        'Género: ${usuario.idGenero}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.bold),
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
    return SizedBox(
      height: 35,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Padding(
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
              prefixIcon: Icon(icono),
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Color(0xFF333333)),
              labelText: "$textoLabel",
              hintText: "$textoHint",
              contentPadding: EdgeInsets.all(8),
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
      ),
    );
  }
}
