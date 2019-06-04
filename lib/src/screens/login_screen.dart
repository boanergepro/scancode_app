import 'package:flutter/material.dart';
import 'package:scancode_app/src/models/user.dart';
import 'package:scancode_app/src/screens/home_screen.dart';
import 'package:scancode_app/src/widgets/custom_textfield.dart';
import 'package:scancode_app/src/services/fetch_data_user.dart';

import 'dart:convert';

import 'package:scancode_app/src/widgets/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  static String routerName = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _usernameController = TextEditingController();
  bool _loadingOverlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
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
                                        autofocus: true,
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
                                          'Ingresa tu username y descubre como el mundo podria ver lo que te define "Tu codigo" ',
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
                                _handleLogin();
                              },
                              child: Text(
                                'Buscar',
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
          LoadingOverlay(
            loading: _loadingOverlay,
          )
        ],
      ),
    );
  }

  void _handleLogin() async {
    setState(() {
      _loadingOverlay = true;
    });
    var response = await fetchDataUser(_usernameController.text);
    User user = User.fromJson(json.decode(response.body));
    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        _loadingOverlay = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
                currentUser: user,
              ),
        ),
      );
    } else {
      setState(() {
        _loadingOverlay = false;
      });
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
              'Error! Por favor verifique el nobre de usurio o su conexion a internet'),
        ),
      );
      throw Exception('Failed to load User');
    }
  }
}
