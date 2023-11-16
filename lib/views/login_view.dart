//Uygulamamızın giriş ekranı, aynı zamanda uygulamayı açtığımızda karşımıza çıkan ilk ekran

import 'package:flutter/material.dart';
import 'package:demo/controllers/login_controller.dart';
import 'package:demo/widgets/common.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Giriş Ekranı"),
      body: Stack(children: [
        background(context),
        Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Kullanıcı Adı',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                  ),
                  onChanged: controller.setUsername,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                  ),
                  obscureText: true,
                  onChanged: controller.setPassword,
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => controller.login(context),
                  child: Text('Giriş',style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
