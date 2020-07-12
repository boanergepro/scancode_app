import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/widgets/drawer.dart';
import 'package:scancode_app/src/widgets/home_header.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/providers/app.dart';
import 'package:scancode_app/src/widgets/home_badges.dart';
import 'package:scancode_app/src/widgets/home_languages.dart';
import 'package:scancode_app/src/widgets/loading_overlay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  static final routerName = '/home';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userState = Provider.of<UserProvider>(context);
    final appState = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.bars),
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
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      // Section header
                      HomeHeader(userState: userState,),
                      // Section badge
                      HomeBadges(userState: userState,),
                      //Languages
                      HomeLanguages(userState: userState,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          LoadingOverlay(
            loading: appState.loadingOverlay,
          ),
        ],
      ),
    );
  }
}
