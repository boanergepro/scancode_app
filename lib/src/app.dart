import 'package:flutter/material.dart';
import 'package:scancode_app/src/custom_theme.dart';
import 'package:scancode_app/src/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme,
      debugShowCheckedModeBanner: false,
      title: 'scancode',
      routes: routes,
    );
  }
}
