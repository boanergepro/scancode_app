import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  bool _loadingOverlay;

  AppProvider() {
    _loadingOverlay = false;
  }

  bool get loadingOverlay => _loadingOverlay;

  set loadingOverlay(value) {
    _loadingOverlay = value;
    notifyListeners();
  }
}
