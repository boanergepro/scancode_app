import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/providers/app.dart';
import 'package:scancode_app/src/screens/leaders_screen.dart';
import 'package:scancode_app/src/providers/leader.dart';
import 'package:scancode_app/src/screens/login_screen.dart';
import 'package:scancode_app/src/screens/home_screen.dart';
import 'package:scancode_app/src/screens/projects_screen.dart';

Widget drawer(BuildContext context) {
  final leadersState = Provider.of<LeaderProvider>(context);
  final appState = Provider.of<AppProvider>(context);
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text(
            '//ScanCode',
            style: TextStyle(
              fontFamily: 'BalooDa',
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.perm_contact_calendar,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            'My profile',
            style: TextStyle(
              fontFamily: 'BalooDa',
              fontSize: 15,
            ),
          ),
          onTap: () {
           Navigator.pushNamed(context, HomeScreen.routerName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.people,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            'Leaders',
            style: TextStyle(
              fontFamily: 'BalooDa',
              fontSize: 15,
            ),
          ),
          onTap: () {
            _getLeaders(appState, leadersState, context);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.code,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            'Top Projects',
            style: TextStyle(
              fontFamily: 'BalooDa',
              fontSize: 15,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, ProjectsScreen.routerName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            'Exit',
            style: TextStyle(
              fontFamily: 'BalooDa',
              fontSize: 15,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, LoginScreen.routerName);
          },
        ),
      ],
    ),
  );
}

void _getLeaders(AppProvider appState, LeaderProvider leadersState,
    BuildContext context) async {
  Navigator.pop(context);
  appState.loadingOverlay = true;

  var responseCode = await leadersState.loadDataLeaders();

  if (responseCode == 200) {
    appState.loadingOverlay = false;
    Navigator.pushNamed(context, LeadersScreen.routerName);
  } else {
    appState.loadingOverlay = false;
  }
}
