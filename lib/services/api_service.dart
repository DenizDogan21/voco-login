// api servisimizin bulunduğu sayfa

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {'email': username, 'password': password},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['token']; // Token döndür
    }
    return null;
  }
}
