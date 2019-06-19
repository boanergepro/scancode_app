import 'package:flutter/material.dart';
import 'package:scancode_app/src/screens/home_screen.dart';
import 'package:scancode_app/src/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/providers/app.dart';
import 'package:scancode_app/src/widgets/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  static final routerName = '/';

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

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Theme.of(context).primaryColor,
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
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: <Widget>[
                                Spacer(
                                  flex: 2,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    children: <Widget>[
                                      // Texxfiel
                                      Expanded(
                                        flex: 3,
                                        child: customTextField(
                                          controller: _usernameController,
                                          labelText: 'username',
                                          prefixIcon: Icons.alternate_email,
                                        ),
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
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
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              color: Theme.of(context).primaryColor,
                              child: RaisedButton(
                                onPressed: () {
                                  _handleLogin(context, appState, userState);
                                },
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                    fontFamily: 'BalooDa',
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          )
                        ],
                      ),
                    ),
                  )
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
          content: Text(
              'Error! write a username'),
        ),
      );
    }
  }
}
