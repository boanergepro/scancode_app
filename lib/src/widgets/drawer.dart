import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/providers/app.dart';
import 'package:scancode_app/src/screens/leaders_screen.dart';
import 'package:scancode_app/src/providers/leader.dart';
import 'package:scancode_app/src/widgets/loading_overlay.dart';

Widget drawer(BuildContext context){
  final leadersState = Provider.of<LeaderProvider>(context);
  final appState = Provider.of<AppProvider>(context);
  return Drawer(
    child: Stack(
      children: <Widget>[
        ListView(
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
                _getLeaders(appState, leadersState, context);
              },
            ),
          ],
        ),
        LoadingOverlay(
          loading: appState.loadingOverlay,
        )
      ],
    )
  );
}

void _getLeaders(AppProvider appState, LeaderProvider leadersState, BuildContext context) async {
  appState.loadingOverlay = true;

  var responseCode = await leadersState.loadDataLeaders();

  if (responseCode == 200) {
    appState.loadingOverlay = false;
    Navigator.pushNamed(context, LeadersScreen.routerName);
  } else {
    appState.loadingOverlay = false;
  }
}