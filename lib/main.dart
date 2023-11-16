// Author: Deniz Doğan

import 'package:demo/services/token_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo/views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TokenService.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginView(), // Başlangıç sayfası LoginView olarak ayarlandı
    );
  }
}

