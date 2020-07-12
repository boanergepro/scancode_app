import 'package:flutter/material.dart';
import 'package:scancode_app/src/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routerName = '/';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: timeout(context),
      builder: (context, data) {
        if (data.connectionState == ConnectionState.done) {
          return Container();
        }
        return splash(context);
      },
    );
  }

  Future<void> timeout(BuildContext context) async {
    await Future.delayed(
      Duration(
        seconds: 2,
      ),
    );
    Navigator.of(context).pushReplacementNamed(LoginScreen.routerName);
  }

  Widget splash(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '//ScanCode',
                  style: TextStyle(
                    fontFamily: 'BalooDa',
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
