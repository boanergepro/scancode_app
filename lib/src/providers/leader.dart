import 'package:flutter/material.dart';
import 'package:scancode_app/src/models/leader.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scancode_app/src/api/end_points.dart';

class LeaderProvider with ChangeNotifier {
  List<Leader> _leaders;
  String _languageCode = null;
  String _countryCode = null;

  List<Leader> get leaders => _leaders;

  Future<int> loadDataLeaders() async {
    final response = await http.get(URL_LEADERS);
    switch (response.statusCode) {
      case 200:
        final results =
            List<Map<dynamic, dynamic>>.from(json.decode(response.body));

        _leaders = results.map((item) => Leader.fromJson(item)).toList();
        notifyListeners();
        return 200;
      default:
        return 404;
    }
  }

  String get languageCode => _languageCode;

  String get countryCode => _countryCode;

  set currentCountryCode(value){
    _countryCode = value;
    notifyListeners();
  }

  set currentLanguageCode(value){
    _languageCode = value;
    notifyListeners();
  }

}
