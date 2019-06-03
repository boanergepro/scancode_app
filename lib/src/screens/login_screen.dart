import 'package:flutter/material.dart';

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
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    ));
  }
}
