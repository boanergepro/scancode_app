import 'package:flutter/material.dart';
import 'package:scancode_app/src/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  static String routerName = '/';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                      )),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      //color: Theme.of(context).primaryColor,
                      child: RaisedButton(
                        onPressed: () {},
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
    ));
  }
}
