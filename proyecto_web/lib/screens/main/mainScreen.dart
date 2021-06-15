import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_web/controllers/menuController.dart';
import 'package:proyecto_web/screens/generalScreen/components/inicioScreen.dart';
import 'package:proyecto_web/screens/generalScreen/components/interesesScreen.dart';
import 'package:proyecto_web/screens/generalScreen/components/loginScreen.dart';
import 'package:proyecto_web/screens/main/components/side_menu.dart';
import 'package:proyecto_web/responsive.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var paginas = [
    InicioScreen(),
    InteresesScreen(),
  ];

  PageController pageController = new PageController(
    initialPage: 0,
  );
  int paginaSeleccionada = 0;

  @override
  Widget build(BuildContext context) {
    print(paginaSeleccionada);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: context.read<MenuController>().scaffoldKey,
      drawer: sideMenu(context, paginaSeleccionada),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black,
                        offset: Offset(10, 0),
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                  child: sideMenu(context, paginaSeleccionada),
                ),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Column(
                children: [
                  SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://russo.xyz/beta/wp-content/uploads/2019/07/grad.gif"),
                                ),
                              ),
                              child: PageView(
                                physics: NeverScrollableScrollPhysics(),
                                children: paginas,
                                controller: pageController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sideMenu(context, seleccionado) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Theme.of(context).shadowColor,
                          offset: Offset(0, 3),
                          spreadRadius: -2,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://cdn4.iconfinder.com/data/icons/business-square-gradient-shadow-2/512/xxx012-512.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: TextButton(
                                  child: Text('Alejandro Ortega',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(height: 3),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Salir', textAlign: TextAlign.center),
                                Container(
                                  width: 25,
                                  child: Icon(MdiIcons.logout, size: 18),
                                ),
                              ],
                            ),
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
                                    child: LoginScreen(),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DrawerListTile(
              0,
              seleccionado,
              "Inicio",
              "https://image.flaticon.com/icons/png/128/3208/3208668.png",
              () {
                if (this.mounted) {
                  setState(() {
                    paginaSeleccionada = 0;
                    pageController.jumpToPage(0);
                  });
                }
              },
            ),
            DrawerListTile(
              1,
              seleccionado,
              "Mis intereses",
              "https://image.flaticon.com/icons/png/128/929/929417.png",
              () {
                if (this.mounted) {
                  setState(() {
                    paginaSeleccionada = 1;
                    pageController.jumpToPage(1);
                  });
                }
              },
            ),
            DrawerListTile(
              2,
              seleccionado,
              "Chats",
              "https://image.flaticon.com/icons/png/128/724/724713.png",
              () {
                if (this.mounted) {
                  setState(() {
                    seleccionado = 3;
                  });
                }
              },
            ),
            DrawerListTile(
              3,
              seleccionado,
              "Configuración",
              "https://image.flaticon.com/icons/png/128/653/653622.png",
              () {
                if (this.mounted) {
                  setState(() {
                    seleccionado = 4;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
