import 'package:flutter/material.dart';
import 'package:proyecto_web/responsive.dart';
import 'package:proyecto_web/screens/components/chatIndividualScreen.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Stack(
        children: [
          Row(
            children: [
              if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 3,
                child: ChatIndividual(),
              ),
            ],
          ),
          Row(
            children: [
              if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: Theme.of(context).shadowColor,
                          offset: Offset(-3, 0),
                          spreadRadius: -4,
                        ),
                      ],
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 16),
                              child: Text(
                                'Mis chats',
                                textScaleFactor: 1.3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(color: Colors.transparent),
                            chatTile(1),
                            chatTile(2),
                            chatTile(3),
                            chatTile(4),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              Expanded(flex: 3, child: Container()),
            ],
          ),
        ],
      ),
    );
  }

  Widget chatTile(int index) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
      ),
      onPressed: () {},
      child: Container(
        height: 60,
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage("https://www.peterbe.com/avatar.$index.png"),
                ),
              ),
            ),
            Container(width: 7),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Francisco Villa',
                    textScaleFactor: .95,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Me ha ido muy bien últimamente con lo del trabajo en la nueva fábrica',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
