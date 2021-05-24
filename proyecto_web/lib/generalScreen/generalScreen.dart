import 'package:flutter/material.dart';
import 'package:proyecto_web/generalScreen/components/inicioScreen.dart';
import 'package:proyecto_web/responsive.dart';

class GeneralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: InicioScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
