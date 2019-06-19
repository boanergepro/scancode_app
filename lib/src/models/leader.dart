import 'package:scancode_app/src/api/countries.dart';
class Leader {
  String _id;
  String _name;
  String _username;
  String _avatarUrl;
  String _location;
  Map<String, dynamic> _experience;
  String _countryCode;

  // Constructor
  Leader.fromJson(Map<dynamic, dynamic> json) {
    _id = json['_id'] ?? null;
    _name = json['name'] ?? "";
    _username = json['login'] ?? "";
    _avatarUrl = json['avatarUrl'] ?? "";
    _location = json['location'] ?? "";
    _experience = json['experience'] ?? "";
    _countryCode = json['countryCode'] ?? "";

  }

  // Getter
  String get id => _id;

  String get name => _name;

  String get username => _username;

  String get avatarUrl => _avatarUrl;

  String get location => _location;

  Map<String, dynamic> get experience => _experience;

  String get countryCode => _countryCode;

  String get countryName => countries[_countryCode] ?? "N/A ";

}
