// kullanıcı adı ve şifre bilgilerini yönetir ve kullanıcıların giriş yapmasını
// sağlar. Kullanıcı adı ve şifre boş olmadığında, ApiService aracılığıyla giriş
// yapar ve başarılı giriş durumunda token'ı yerel olarak saklar, aksi halde bir hata mesajı gösterir.

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/token_service.dart';

class LoginController {
  String username = '';
  String password = '';

  void setUsername(String value) {
    username = value;
  }

  void setPassword(String value) {
    password = value;
  }


  Future<void> login(BuildContext context) async {
    if (username.isEmpty || password.isEmpty) {
      _showSnackBar(context, 'Kullanıcı adı ve şifre gereklidir');
      return;
    }

    var token = await ApiService.login(username, password);
    if (token != null) {
      await TokenService.setToken(token);
      _showSnackBar(context, 'Başarıyla giriş yapıldı');
      // Başarılı giriş, ana sayfaya yönlendirme işlemleri
    } else {
      _showSnackBar(context, 'Giriş başarısız');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
