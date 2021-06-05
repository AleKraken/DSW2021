import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_web/sharedPreferences/SPHelper.dart';

class ConfiguracionScreen extends StatefulWidget {
  @override
  _ConfiguracionScreenState createState() => _ConfiguracionScreenState();
}

class _ConfiguracionScreenState extends State<ConfiguracionScreen> {
  bool fondoEstatico = SPHelper.getInt('fondoEstatico') == 0 ? false : true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: 330,
          ),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(30),
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
                height: 410,
                width: MediaQuery.of(context).size.width - 80,
                constraints: BoxConstraints(
                  maxWidth: 400,
                  minHeight: 410,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(height: 20),
                      Text(
                        'Configuración',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Color(0xFF333333)),
                      ),
                      Container(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Fondo estático',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          Container(width: 15),
                          Expanded(
                            child: Wrap(
                              children: [
                                Switch(
                                  value: fondoEstatico,
                                  onChanged: (value) {
                                    setState(() {
                                      fondoEstatico = value;
                                      SPHelper.setInt(
                                          'fondoEstatico', value ? 1 : 0);
                                    });
                                  },
                                  activeTrackColor:
                                      Theme.of(context).primaryColorLight,
                                  activeColor: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
