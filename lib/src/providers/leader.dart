import 'dart:core';
import 'package:flutter/material.dart';
import 'package:scancode_app/src/models/leader.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LeaderProvider with ChangeNotifier {
  List<Leader> _leaders;
  String _languageCode;
  String _countryCode;

  List<Leader> get leaders => _leaders;

  Future<int> loadDataLeaders({languageCode, countryCode}) async {
    Uri _uri = Uri.https('codetrace.com', 'api/leaders',
        {'language': languageCode, 'country': countryCode});

    final response = await http.get(_uri.toString());

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

  set currentCountryCode(value) {
    _countryCode = value;
    notifyListeners();
  }

  set currentLanguageCode(value) {
    _languageCode = value;
    notifyListeners();
  }
}
