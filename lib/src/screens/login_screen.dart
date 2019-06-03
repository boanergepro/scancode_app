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
      appBar: AppBar(
        leading: Icon(Icons.insert_emoticon),
        title: Text('ScanCode'),
      ),
    );
  }
}
