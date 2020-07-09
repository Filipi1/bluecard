import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5)
              ),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 40,
              height: 220,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("CONTA", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    PersonalInput(),
                    SizedBox(height: 20,),
                    Text("SENHA", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    PersonalInput(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalInput extends StatelessWidget {

  bool isPassword;

  PersonalInput({this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          obscureText: isPassword,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}

