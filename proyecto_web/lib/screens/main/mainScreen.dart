import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_web/controllers/menuController.dart';
import 'package:proyecto_web/models/usuario.dart';
import 'package:proyecto_web/screens/components/chatsScreen.dart';
import 'package:proyecto_web/screens/components/configuracionScreen.dart';
import 'package:proyecto_web/screens/components/inicioScreen.dart';
import 'package:proyecto_web/screens/components/interesesScreen.dart';
import 'package:proyecto_web/screens/components/loginScreen.dart';
import 'package:proyecto_web/screens/components/perfilUsuarioScreen.dart';
import 'package:proyecto_web/screens/components/vistaUsuarioScreen.dart';
import 'package:proyecto_web/screens/main/components/sideMenuTile.dart';
import 'package:proyecto_web/responsive.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final int pantallaInicio;
  final Usuario usuario;

  MainScreen(this.pantallaInicio, this.usuario);

  @override
  _MainScreenState createState() => _MainScreenState(pantallaInicio, usuario);
}

class _MainScreenState extends State<MainScreen> {
  final int pantallaInicio;
  final Usuario usuario;
  _MainScreenState(this.pantallaInicio, this.usuario);

  var paginas;

  PageController pageController;

  int paginaSeleccionada;

  @override
  void initState() {
    pageController = new PageController(initialPage: pantallaInicio);
    paginaSeleccionada = pantallaInicio;
    paginas = [
      InicioScreen(usuario),
      InteresesScreen(),
      ChatsScreen(),
      ConfiguracionScreen(),
      PerfilUsuario(usuario),
      VistaUsuario(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      key: context.read<MenuController>().scaffoldKey,
      drawer: sideMenu(context, paginaSeleccionada),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Responsive.isDesktop(context)
                    ? Expanded(flex: 1, child: Container())
                    : Container(),
                Expanded(
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
            if (Responsive.isDesktop(context))
              Row(
                children: [
                  Expanded(
                    child: sideMenu(context, paginaSeleccionada),
                  ),
                  Expanded(flex: 5, child: Container()),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget sideMenu(context, seleccionado) {
    return Drawer(
      elevation: 6,
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
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
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 4)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${usuario.nombre}',
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    Text(
                                      'Editar perfil',
                                      textAlign: TextAlign.start,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  if (this.mounted) {
                                    setState(() {
                                      paginaSeleccionada = 4;
                                      pageController.jumpToPage(4);
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(height: 3),
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
                  paginaSeleccionada = 2;
                  pageController.jumpToPage(2);
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
                  paginaSeleccionada = 3;
                  pageController.jumpToPage(3);
                });
              }
            },
          ),
          Expanded(child: Container()),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Cerrar sesión', textAlign: TextAlign.center),
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
          ),
        ],
      ),
    );
  }
}
