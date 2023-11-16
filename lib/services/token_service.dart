// Bu sayfa, kullanıcıların API erişim tokenlarını veya benzeri kimlik doğrulama
// bilgilerini yerel olarak saklamak ve gerektiğinde erişmek için kullanılır

import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async =>
      await _preferences?.setString('token', token);

  static String? getToken() => _preferences?.getString('token');
}
