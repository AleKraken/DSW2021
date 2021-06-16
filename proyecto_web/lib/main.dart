import 'package:flutter/material.dart';
import 'package:proyecto_web/controllers/menuController.dart';
import 'package:proyecto_web/screens/components/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_web/screens/main/mainScreen.dart';
import 'package:proyecto_web/utils/tema.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web Project',
      theme: temaPrincipal(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: //LoginScreen(),
            MainScreen(),
      ),
    );
  }
}
