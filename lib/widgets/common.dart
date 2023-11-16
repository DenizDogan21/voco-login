// Bu sayfa, cogu arayuzde kullanacagimiz arkaplan tasarimini ve appbar'i barindirir

import 'package:flutter/material.dart';

Widget background(BuildContext context) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
    ),
  );
}

PreferredSizeWidget? appBar(BuildContext context, String pageTitle) {
  return AppBar(
    backgroundColor: Colors.blueGrey,
    title: Text(
      pageTitle,
      style: TextStyle(color: Colors.white, fontSize: 24),
    ),
    elevation: 0,
  );
}
