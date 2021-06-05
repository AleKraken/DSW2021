import 'package:flutter/material.dart';
import 'package:proyecto_web/controllers/menuController.dart';
import 'package:proyecto_web/screens/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_web/sharedPreferences/SPHelper.dart';
import 'package:proyecto_web/utils/tema.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences.getInstance().then((SharedPreferences sp) {
    SPHelper.setPref(sp);
    SPHelper.setInt('fondoEstatico', 1);

    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Web',
      theme: temaPrincipal(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: LoginScreen(),
      ),
    );
  }
}
