import 'package:flutter/material.dart';

import 'pages/home.page.dart';

void main() => runApp(CardApp());

class CardApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Serrat",
        primaryColor: Color(0xFF0066FF),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}