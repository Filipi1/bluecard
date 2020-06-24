import 'package:creditcard/controllers/log.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Olá, ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38),
                    ),
                    Text(
                      "Filipe",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SquareMenuTile(title: 'DESBLOQUEAR CARTÃO', iconData: Icons.lock_outline),
                      SizedBox(width: 10),
                      SquareMenuTile(title: 'PAGAR', iconData: Icons.outlined_flag),
                      SizedBox(width: 10),
                      SquareMenuTile(title: 'TRANSFERIR', iconData: Icons.call_missed_outgoing),
                      SizedBox(width: 10),
                      SquareMenuTile(title: 'DESBLOQUEAR CARTÃO', iconData: Icons.lock_outline),
                    ],
                  ),
                ),
              ),

              BoxInfo(),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("INFORMATIVOS"),
              ),


              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("TRANSAÇÕES RECENTES"),
              ),

              TransactionTile(dateTime: "20/10/2020 às 13:25", value: "R\$ 220,00", title: "Pagseguro Fran*",),
              TransactionTile(dateTime: "08/02/2020 às 21:56", value: "R\$ 9,99", title: "Amazon Prime", icon: FontAwesomeIcons.theaterMasks,),
              TransactionTile(dateTime: "14/05/2019 às 12:11", value: "R\$ 74,60", title: "Xiaomi Band", icon: FontAwesomeIcons.tv,),
            ],
          ),
        ),
      )),
    );
  }
}

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


class TransactionTile extends StatelessWidget {
  final String title;
  final String value;
  final String dateTime;
  final IconData icon;

  TransactionTile({@required this.title, @required this.value, @required this.dateTime, this.icon = FontAwesomeIcons.shoppingBag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LogController logController = new LogController();
        logController.obter();
      },
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Ink(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(width: 50, alignment: Alignment.center, child: FaIcon(icon, size: 40, color: Colors.grey,)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),),
                  Text(value.toString()),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Icon(Icons.access_time, size: 15, color: Colors.grey,),
                      ),
                      Text(dateTime, style: TextStyle(color: Colors.grey),),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),),
    );
  }
}

class BoxInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 220,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
              colors: [Color(0xFF0090FF), Theme.of(context).primaryColor]),
          borderRadius: BorderRadius.all(Radius.circular(2))
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: FaIcon(FontAwesomeIcons.handHoldingUsd, color: Colors.white.withAlpha(80), size: 50,),
            ),
            Text("FATURA ABERTA", style: TextStyle(color: Colors.white.withAlpha(90), fontWeight: FontWeight.bold, fontSize: 22) ),
            Text("R\$ 8178,73", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40) ),
          ],
        ),
      ),
    );
  }
}
