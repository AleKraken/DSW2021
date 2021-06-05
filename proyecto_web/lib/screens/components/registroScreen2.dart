import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_web/controllers/menuController.dart';
import 'package:proyecto_web/controllers/registroController.dart';
import 'package:proyecto_web/models/usuario.dart';
import 'package:proyecto_web/screens/components/loginScreen.dart';
import 'package:proyecto_web/screens/components/registroScreen1.dart';
import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';
import 'package:image_picker/image_picker.dart';

class RegistroScreen2 extends StatefulWidget {
  final String email;
  final String password;

  RegistroScreen2(this.email, this.password);

  @override
  _RegistroScreen2State createState() => _RegistroScreen2State(email, password);
}

class _RegistroScreen2State extends State<RegistroScreen2> {
  final String email;
  final String password;

  _RegistroScreen2State(this.email, this.password);

  final List<TextEditingController> listaControladores =
      <TextEditingController>[];
  final List<FocusNode> listaFocus = <FocusNode>[];
  File imageFile;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      listaControladores.add(new TextEditingController());
      listaFocus.add(new FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: 350,
            ),
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://russo.xyz/beta/wp-content/uploads/2019/07/grad.gif"),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    maxWidth: 400,
                    minHeight: 450,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(MdiIcons.arrowLeft),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MultiProvider(
                                      providers: [
                                        ChangeNotifierProvider(
                                          create: (context) => MenuController(),
                                        ),
                                      ],
                                      child: RegistroScreen(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Expanded(
                              child: Text(
                                'Registro',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(color: Color(0xFF333333)),
                              ),
                            ),
                            Container(width: 28),
                          ],
                        ),
                        Container(height: 20),
                        Text(
                          '¡Completa con información personal!',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Container(height: 50),
                        Container(
                          width: 400,
                          alignment: Alignment.center,
                          child: textField(listaControladores[0], 0, context,
                              'Nombre(s)', '', false, 0, MdiIcons.account),
                        ),
                        Container(
                          width: 400,
                          alignment: Alignment.center,
                          child: textField(listaControladores[1], 1, context,
                              'País', '', false, 0, MdiIcons.flag),
                        ),
                        Container(
                          width: 400,
                          alignment: Alignment.center,
                          child: textField(
                            listaControladores[2],
                            2,
                            context,
                            'Edad',
                            '',
                            false,
                            0,
                            MdiIcons.cakeVariant,
                          ),
                        ),
                        Container(
                          width: 400,
                          alignment: Alignment.center,
                          child: textField(listaControladores[3], 3, context,
                              'Género', '', false, 0, MdiIcons.flag),
                        ),
                        Container(
                          width: 400,
                          alignment: Alignment.center,
                          child: textField(listaControladores[4], 4, context,
                              'Info', '', false, 0, MdiIcons.flag),
                        ),
                        Container(
                          width: 300,
                          margin: EdgeInsets.all(5),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.15),
                            ),
                            child: Text('Seleccionar imagen'),
                            onPressed: () async {
                              imageFile = await seleccionarImagen(context);
                            },
                          ),
                        ),
                        Container(height: 20),
                        Container(
                          width: 300,
                          margin: EdgeInsets.all(5),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.15),
                            ),
                            child: Text('Registrarse'),
                            onPressed: () async {
                              Usuario usuario = new Usuario(
                                email,
                                password,
                                listaControladores[0].text,
                                listaControladores[1].text,
                                listaControladores[2].text,
                                listaControladores[3].text,
                                listaControladores[4].text,
                              );

                              await RegistroController.registrarUsuario(
                                  usuario);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiProvider(
                                    providers: [
                                      ChangeNotifierProvider(
                                        create: (context) => MenuController(),
                                      ),
                                    ],
                                    child: LoginScreen(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<File> seleccionarImagen(context) async {
    final ImagePicker _picker = ImagePicker();
    PickedFile _archivo = await _picker.getImage(source: ImageSource.gallery);
    return Future.value(File(_archivo.path));
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
