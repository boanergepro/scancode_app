import 'package:flutter/material.dart';
import 'package:scancode_app/src/custom_theme.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/providers/app.dart';
import 'package:scancode_app/src/routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(builder: (context) => UserProvider()),
      ChangeNotifierProvider(builder: (context) => AppProvider(),),
    ],
      child: MaterialApp(
        theme: customTheme,
        debugShowCheckedModeBanner: false,
        title: 'scancode',
        routes: routes,
      ),
    );
  }
}
