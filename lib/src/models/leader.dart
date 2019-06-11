import 'package:scancode_app/src/providers/leaders.dart';
import 'package:http/http.dart' as http;
import 'package:scancode_app/src/api/end_points.dart';

class Leaders{
  String _name;
  String _username;
  String _avatarUrl;
  String _location;
  Map<String,dynamic> _experience;
  String _countryCode;

  // Constructor
  Leaders.fromJson(List<dynamic> json){
    json.map((item) => Leaders.fromJson(item)).toList();
  }

  loadData() async{
    final response = await http.get(URL_LEADERS);
    return response.body;
  }

  // Getter
  String get name => _name;
  String get username => _username;
  String get avatarUrl => _avatarUrl;
  String get location => _location;
  Map<String,dynamic> get experience => _experience;
  String get countryCode => _countryCode;


}