import 'package:flutter/material.dart';
import 'package:scancode_app/src/screens/home_screen.dart';
import 'package:scancode_app/src/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/providers/app.dart';
import 'package:scancode_app/src/widgets/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  static final routerName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);
    final userState = Provider.of<UserProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: size.height * 0.4,
                    child: Center(
                      child: Text(
                        '//ScanCode',
                        style: TextStyle(
                          fontFamily: 'BalooDa',
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // Texxfiel
                  Container(
                    height: size.height * 0.4,
                    margin: EdgeInsets.only(
                      top: 15,
                      left: 50,
                      right: 50,
                      bottom: 15,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        customTextField(
                          controller: _usernameController,
                          labelText: 'username',
                          prefixIcon: Icons.alternate_email,
                        ),
                        // Text
                        Container(
                          child: Text(
                            'Enter your username and discover how the world could see what defines you "Your code" ',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'BalooDa',
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _handleLogin(context, appState, userState);
                    },
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      width: size.width,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'Search',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'BalooDa',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          LoadingOverlay(
            loading: appState.loadingOverlay,
          )
        ],
      ),
    );
  }

  void _handleLogin(
      context, AppProvider appState, UserProvider userState) async {
    if (_usernameController.text != '') {
      appState.loadingOverlay = true;

      var responseCode = await userState.loadDataUser(_usernameController.text);

      if (responseCode == 200) {
        appState.loadingOverlay = false;
        Navigator.pushNamed(context, HomeScreen.routerName);
      } else {
        appState.loadingOverlay = false;
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
                'Error! Please verify the username or your internet connection'),
          ),
        );
        throw Exception('Failed to load User');
      }
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Error! write a username'),
        ),
      );
    }
  }
}
