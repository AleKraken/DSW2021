import 'package:age_calculator/age_calculator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_web/controllers/menuController.dart';
import 'package:proyecto_web/controllers/registroController.dart';
import 'package:proyecto_web/controllers/usuarioController.dart';
import 'package:proyecto_web/models/genero.dart';
import 'package:proyecto_web/models/pais.dart';
import 'package:proyecto_web/models/usuario.dart';
import 'package:proyecto_web/screens/components/loginScreen.dart';
import 'package:proyecto_web/screens/components/registroScreen1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';

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
  PickedFile archivo;
  Future _futureListaPaises;

  List<String> listaPaises = <String>[];
  List<String> listaGeneros = <String>[];

  @override
  void initState() {
    super.initState();
    _futureListaPaises = llenarListas();
    for (int i = 0; i < 2; i++) {
      listaControladores.add(new TextEditingController());
      listaFocus.add(new FocusNode());
    }
  }

  int paisSeleccionado = 0;
  int generoSeleccionado = 0;

  Future llenarListas() async {
    List<Pais> paises = <Pais>[];
    List<Genero> generos = <Genero>[];

    paises = await UsuarioController.getPaises();
    generos = await UsuarioController.getGeneros();

    for (int i = 0; i < paises.length; i++) {
      listaPaises.add(paises[i].nomPais);
      await Future.delayed(Duration.zero);
    }

    for (int y = 0; y < generos.length; y++) {
      listaGeneros.add(generos[y].nomGenero);
      await Future.delayed(Duration.zero);
    }

    return await Future.delayed(Duration.zero);
  }

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final dropdownDatePicker = DropdownDatePicker(
      firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
      lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
      textStyle: Theme.of(context).textTheme.headline4,
      dropdownColor: Colors.white,
      dateHint: DateHint(year: 'Año', month: 'Mes', day: 'Día'),
      ascending: false,
    );

    return Scaffold(
      body: SingleChildScrollView(
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
          child: FutureBuilder(
              future: _futureListaPaises,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        duration: Duration(milliseconds: 200),
                        child: SlideInUp(
                          duration: Duration(milliseconds: 200),
                          child: Container(
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
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 7),
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
                                              builder: (context) =>
                                                  MultiProvider(
                                                providers: [
                                                  ChangeNotifierProvider(
                                                    create: (context) =>
                                                        MenuController(),
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
                                              .copyWith(
                                                  color: Color(0xFF333333)),
                                        ),
                                      ),
                                      Container(width: 28),
                                    ],
                                  ),
                                  Container(height: 20),
                                  Text(
                                    '¡Completa con información personal!',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Container(height: 50),
                                  Container(
                                    width: 400,
                                    alignment: Alignment.center,
                                    child: textField(
                                      listaControladores[0],
                                      0,
                                      context,
                                      'Nombre(s)',
                                      '',
                                      false,
                                      0,
                                      MdiIcons.account,
                                    ),
                                  ),
                                  Container(
                                    width: 400,
                                    alignment: Alignment.center,
                                    child: textField(
                                      listaControladores[1],
                                      1,
                                      context,
                                      'Info',
                                      '',
                                      false,
                                      0,
                                      MdiIcons.dataMatrix,
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: new Text('Seleccionar país'),
                                      value: listaPaises == null
                                          ? null
                                          : listaPaises[paisSeleccionado],
                                      items: listaPaises.map((String value) {
                                        return new DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ));
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          paisSeleccionado =
                                              listaPaises.indexOf(value);
                                        });
                                        print(paisSeleccionado);
                                      },
                                    ),
                                  ),
                                  Container(height: 30),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      hint: new Text('Seleccionar género'),
                                      value: listaGeneros == null
                                          ? null
                                          : listaGeneros[generoSeleccionado],
                                      items: listaGeneros.map((String value) {
                                        return new DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ));
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          generoSeleccionado =
                                              listaGeneros.indexOf(value);
                                        });
                                        print(generoSeleccionado);
                                      },
                                    ),
                                  ),
                                  Container(height: 30),
                                  Text(
                                    'Fecha de nacimiento:',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Container(height: 8),
                                  dropdownDatePicker,
                                  Container(height: 30),
                                  /*
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
                                        DateTime birthday = DateTime(
                                            dropdownDatePicker.year,
                                            dropdownDatePicker.month,
                                            dropdownDatePicker.day);

                                        DateDuration duration =
                                            AgeCalculator.age(birthday);

                                        print(duration);
                                      },
                                    ),
                                  ),
                                  */
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
                                        DateTime birthday = DateTime(
                                            dropdownDatePicker.year,
                                            dropdownDatePicker.month,
                                            dropdownDatePicker.day);

                                        DateDuration dateDuration =
                                            AgeCalculator.age(birthday);
                                        int edad = dateDuration.years;

                                        Usuario usuario = new Usuario(
                                          email,
                                          password,
                                          listaControladores[0].text,
                                          (paisSeleccionado + 1).toString(),
                                          edad.toString(),
                                          (generoSeleccionado + 1).toString(),
                                          listaControladores[1].text,
                                        );

                                        await RegistroController
                                            .registrarUsuario(usuario);

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
                        ),
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }

  Future<PickedFile> seleccionarImagen(context) async {
    final ImagePicker _picker = ImagePicker();
    PickedFile _archivo = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 500.0,
      maxWidth: 500.0,
    );
    print("retornando con $_archivo");

    return _archivo;
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
