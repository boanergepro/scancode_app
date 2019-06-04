import 'package:http/http.dart' as http;

Future fetchDataUser(String username) async {
  final response = await http.get(
      'https://codetrace.com/api/users/login/$username');
  return response;
}