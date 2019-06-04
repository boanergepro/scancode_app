import 'package:flutter/material.dart';
import 'package:scancode_app/src/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider with ChangeNotifier {
  User _user;

  User get user => _user;

  Future<int> loadDataUser(String username) async {
    final response = await http.get(
        'https://codetrace.com/api/users/login/$username');
    switch (response.statusCode) {
      case 200:
        _user = User.fromJson(json.decode(response.body));
        notifyListeners();
        return 200;
      default:
        return 404;
    }
  }
}