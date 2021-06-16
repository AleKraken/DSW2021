import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_web/controllers/loginController.dart';
import 'package:proyecto_web/controllers/menuController.dart';
import 'package:proyecto_web/screens/components/registroScreen.dart';
import 'package:proyecto_web/screens/main/mainScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<TextEditingController> listaControladores =
      <TextEditingController>[];
  final List<FocusNode> listaFocus = <FocusNode>[];

  bool validando = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 2; i++) {
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
                  height: 450,
                  width: MediaQuery.of(context).size.width - 80,
                  constraints: BoxConstraints(
                    maxWidth: 400,
                    minHeight: 450,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Iniciar Sesión',
                          style: Theme.of(context)
                              .textTheme
                              .headline1
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
                              'Contraseña', '', true, 0, MdiIcons.account),
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
                            child: validando
                                ? CircularProgressIndicator()
                                : Text('Iniciar'),
                            onPressed: () async {
                              //VALIDAR LAS CREDENCIALES
                              if (!validando) {
                                validando = true;
                                if (await LoginController.validarCredenciales(
                                  listaControladores[0].text,
                                  listaControladores[1].text,
                                )) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MultiProvider(
                                        providers: [
                                          ChangeNotifierProvider(
                                            create: (context) =>
                                                MenuController(),
                                          ),
                                        ],
                                        child: MainScreen(),
                                      ),
                                    ),
                                  );
                                }
                                {}
                                validando = false;
                              }
                              /*
                             
                              */
                            },
                          ),
                        ),
                        Container(height: 15),
                        Container(
                          width: 300,
                          margin: EdgeInsets.all(5),
                          child: TextButton(
                            child: Text('¿No tienes una cuenta? Regístrate'),
                            onPressed: () {
                              if (!validando) {
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
                              }
                            },
                          ),
                        ),
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


/*
FutureBuilder(
      future: DatabaseProvider.db
          .getComidasDelDia()
          .then((listaComidas) => listaComidasDelDia = listaComidas),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else {
          for (int i = 0; i < listaComidasDelDia.length; i++) {
            listaBotones.add(
              Container(
                height: 30,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).buttonColor,
                    Color(0xFF038DB2),
                  ]),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(0, 3),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: 
                */