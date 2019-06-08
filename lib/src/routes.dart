import 'package:flutter/material.dart';
import 'package:scancode_app/src/screens/login_screen.dart';
import 'package:scancode_app/src/screens/home_screen.dart';
import 'package:scancode_app/src/screens/leaders_screen.dart';

final routes = {
  LoginScreen.routerName: (BuildContext context) => LoginScreen(),
  HomeScreen.routerName: (BuildContext context) => HomeScreen(),
  LeadersScreen.routerName: (BuildContext context) => LeadersScreen(),
};