import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PersonalInput extends StatelessWidget {
  bool isPassword;
  String title;
  double width;
  int maxLength;

  PersonalInput({this.title = "", this.isPassword = false, this.width = 0, this.maxLength = 0});

  @override
  Widget build(BuildContext context) {

    var cpfFormatter = new MaskTextInputFormatter(mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') });

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
          inputFormatters: [cpfFormatter],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}