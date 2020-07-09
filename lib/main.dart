import 'package:creditcard/pages/auth.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home.page.dart';

void main() => runApp(CardApp());

class CardApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Serrat",
        primaryColor: Color(0xFF0066FF),
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}