import 'package:creditcard/controllers/auth.controller.dart';
import 'package:creditcard/models/auth-response.model.dart';
import 'package:creditcard/models/auth.model.dart';
import 'package:creditcard/widgets/personal-input.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatefulWidget {

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  Animation<double> _loginButtonTween;

  AuthController _authController = new AuthController();

  @override
  void initState() {
    super.initState();

    _loginButtonController = new AnimationController(duration: Duration(seconds: 2), vsync: this);
    _loginButtonTween = new Tween(begin: 200.0, end: 40.0).animate(new CurvedAnimation(parent: _loginButtonController, curve: Interval(0, 0.25)));
  }

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
                    PersonalInput(title: "CPF"),
                    SizedBox(height: 20),
                    PersonalInput(title: "Senha", isPassword: true),
                    SizedBox(height: 40),
                    AnimatedBuilder(
                      animation: _loginButtonController,
                      builder: (BuildContext context, child) {
                        return Center(
                          child: Container(
                              height: 45,
                              width: _loginButtonTween.value,
                              child: RaisedButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                                  elevation: 0,
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,

                                  child: _loginButtonTween.value > 180.0 ? Text(
                                    "Entrar",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 22),
                                  ) : Container(width: 15, height: 15, child: CircularProgressIndicator()),
                                  onPressed: () {
                                    _loginButtonController.forward();

                                    AuthModel model = new AuthModel(cpf: "07848467317", password: "12345678");

                                    _authController.signIn(model).then((AuthResponseModel res) {
                                      print(res.user.name);
                                      _loginButtonController.reverse();
                                    }, onError: (e) {
                                      print(e);
                                      _loginButtonController.reverse();
                                    });
                                  })
                          ),
                        );
                      },
                    ),
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loginButtonController.dispose();
  }
}