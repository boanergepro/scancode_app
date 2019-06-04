import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/providers/user.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = '/home';

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Container(
        child: Text(userState.user.name),
      ),
    );
  }
}
