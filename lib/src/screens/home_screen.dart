import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/widgets/drawer.dart';
import 'package:scancode_app/src/widgets/home_header.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/widgets/home_badges.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = '/home';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    final userState = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            //Open Drawer
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Text(
          '//ScanCode',
          style: TextStyle(
            fontFamily: 'BalooDa',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      drawer: drawer(context),
      body: Container(
        height: _screenHeight,
        width: _screenWidth,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    height: _screenHeight / 2.5,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: homeHeader(userState),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    height: _screenHeight / 5,
                    child: homeBadges(userState),
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
