import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SquareMenuTile extends StatelessWidget {
  final String title;
  final IconData iconData;

  SquareMenuTile({this.title, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Ink(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(iconData, size: 40, color: Theme.of(context).primaryColor,),
                  ),
                  Text(title, style: TextStyle(color: Colors.black54, fontSize: 11), textAlign: TextAlign.center,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}