import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: Image.asset("images/logo.png")),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 40,
              height: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        PersonalInput(title: "000000", width: MediaQuery.of(context).size.width / 2.5, maxLength: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Text("-", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 30),),
                        ),
                        PersonalInput(title: "00", width: MediaQuery.of(context).size.width / 3.5, maxLength: 2),
                      ],
                    ),
                    SizedBox(height: 20),
                    PersonalInput(title: "••••••", isPassword: true),
                    SizedBox(height: 40),
                    Container(height: 45, width: MediaQuery.of(context).size.width, child: RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)), elevation: 0, color: Theme.of(context).primaryColor, textColor: Colors.white, child: Text("Entrar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),), onPressed: () {})),
                    SizedBox(height: 15),
                    Center(child: Text("Esqueceu sua senha?"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalInput extends StatelessWidget {
  bool isPassword;
  String title;
  double width;
  int maxLength;

  PersonalInput({this.title = "", this.isPassword = false, this.width = 0, this.maxLength = 0});

  @override
  Widget build(BuildContext context) {

    if (width == 0)
      width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 10)]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          decoration: InputDecoration(hintText: title, counterText: '', border: InputBorder.none),
          keyboardType: TextInputType.number,
          obscureText: isPassword,
          maxLength: maxLength == 0 ? null : maxLength,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
