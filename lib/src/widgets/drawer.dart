import 'package:flutter/material.dart';
import 'package:scancode_app/src/screens/leaders_screen.dart';

Widget drawer(BuildContext context){
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text('//ScanCode',style: TextStyle(
            fontFamily: 'BalooDa',
            fontSize: 30,
            color: Colors.white,
          ),),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          title: Text('Leaders',style: TextStyle(
            fontFamily: 'BalooDa',
            fontSize: 15,
          )),
          onTap: () {
            Navigator.pushNamed(context, LeadersScreen.routerName);
            // ...
          },
        )
      ],
    ),
  );
}