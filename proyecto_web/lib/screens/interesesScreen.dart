import 'package:flutter/material.dart';
import 'package:proyecto_web/controllers/interesController.dart';
import 'package:proyecto_web/models/interes.dart';
import 'package:proyecto_web/responsive.dart';
import 'package:proyecto_web/screens/components/interesComponent.dart';

class InteresesScreen extends StatefulWidget {
  InteresesScreen({Key key}) : super(key: key);

  @override
  _InteresesScreenState createState() => _InteresesScreenState();
}

class _InteresesScreenState extends State<InteresesScreen> {
  Future _futureIntereses;

  List<Interes> intereses = <Interes>[];
  List<InteresUsuario> misInteresesUsuario = <InteresUsuario>[];
  List<Interes> misIntereses = <Interes>[];

  List<String> nombresMisIntereses = <String>[];
  List<String> nombresIntereses = <String>[];

  @override
  void initState() {
    _futureIntereses = getIntereses();
    super.initState();
  }

  bool cargando = false;

  Future getIntereses() async {
    bool agregar = false;

    intereses.clear();
    misInteresesUsuario.clear();
    misIntereses.clear();
    nombresMisIntereses.clear();
    nombresIntereses.clear();

    List<Interes> listaIntereses = await InteresController.getIntereses();

    List<InteresUsuario> listaInteresesUsuario =
        await InteresController.getMisIntereses();

    if (listaInteresesUsuario.isEmpty) {
      intereses = listaIntereses;
      intereses.forEach((interes) {
        nombresIntereses.add(interes.nomInteres);
      });
      return await Future.value(true);
    } else {
      listaIntereses.forEach((interes) async {
        agregar = true;
        listaInteresesUsuario.forEach((interesUsuario) async {
          if (interes.id == int.parse(interesUsuario.idInteres)) {
            misInteresesUsuario.add(interesUsuario);
            misIntereses.add(interes);
            nombresMisIntereses.add(interes.nomInteres);
            agregar = false;
          }
          await Future.delayed(Duration.zero);
        });
        if (agregar) {
          intereses.add(interes);
          nombresIntereses.add(interes.nomInteres);
        }
        await Future.delayed(Duration.zero);
      });
      return await Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 40),
                cargando
                    ? Container()
                    : Text(
                        'Tus intereses',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                Container(height: 20),
                FutureBuilder(
                    future: _futureIntereses,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return misInteresesUsuario.length > 0
                            ? GridView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(20),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 30,
                                  mainAxisSpacing: 25,
                                  mainAxisExtent: 40,
                                  crossAxisCount: Responsive.isMobile(context)
                                      ? 1
                                      : Responsive.isTablet(context)
                                          ? 2
                                          : 3,
                                ),
                                itemBuilder: (_, index) => InteresComponent(
                                  int.parse(
                                      misInteresesUsuario[index].idInteres),
                                  index,
                                  nombresMisIntereses,
                                  intereses,
                                  true,
                                  false,
                                  (bool agregar) async {
                                    setState(() {
                                      cargando = true;
                                    });
                                    await getIntereses();

                                    if (!agregar) {
                                      if (this.mounted) {
                                        cargando = false;
                                        setState(() {});
                                      }
                                    }
                                  },
                                ),
                                itemCount: misInteresesUsuario.length,
                              )
                            : Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    cargando
                                        ? Container()
                                        : Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 12),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://image.flaticon.com/icons/png/512/4076/4076549.png"),
                                              ),
                                            ),
                                          ),
                                    Container(width: 25),
                                    cargando
                                        ? Container()
                                        : Text(
                                            'Aún no has agregado intereses',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1,
                                          ),
                                  ],
                                ),
                              );
                      }
                    }),
                Container(height: 40),
                cargando
                    ? Text(
                        'Modificando intereses',
                        style: Theme.of(context).textTheme.headline1,
                      )
                    : Text(
                        'Agrega más intereses',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                Container(height: 10),
                cargando
                    ? Text(
                        'Espera un momento mientras modificamos tus intereses',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    : Text(
                        'Los intereses te ayudarán a encontrar gente más fácilmente. ¡Elige tus favoritos!',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                Container(height: 20),
                FutureBuilder(
                    future: _futureIntereses,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 25,
                            mainAxisExtent: 40,
                            crossAxisCount: Responsive.isMobile(context)
                                ? 1
                                : Responsive.isTablet(context)
                                    ? 2
                                    : 3,
                          ),
                          itemCount: nombresIntereses.length,
                          itemBuilder: (_, index) => InteresComponent(
                            intereses[index].id,
                            index,
                            nombresIntereses,
                            intereses,
                            false,
                            false,
                            (bool agregar) async {
                              print("ENVIANDO ID: ${intereses[index].id}");

                              setState(() {
                                cargando = true;
                              });
                              await getIntereses();

                              if (agregar) {
                                if (this.mounted) {
                                  cargando = false;
                                  setState(() {});
                                }
                              }
                            },
                          ),
                        );
                      }
                    }),
                cargando
                    ? Container(height: 6, child: LinearProgressIndicator())
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
