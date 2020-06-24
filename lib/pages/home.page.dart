import 'package:creditcard/controllers/log.controller.dart';
import 'package:creditcard/models/transaction.model.dart';
import 'package:creditcard/widgets/square-menu.widget.dart';
import 'package:creditcard/widgets/transaction.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogController logController = new LogController();

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
                child: Text("TRANSAÇÕES RECENTES"),
              ),

              FutureBuilder(
                future: logController.obter(),
                builder: (BuildContext context, AsyncSnapshot transactions) {

                  if(transactions.hasData) {

                    if (transactions.data.length == 0) {
                      return Text("Vazio");
                    }

                    List<TransactionModel> transactionsList = transactions.data;
                    return TransactionList(transactions: transactionsList);
                  }

                  if(transactions.hasError) {
                    return Text("Error");
                  }


                  return CircularProgressIndicator();
                },
              ),

            ],
          ),
        ),
      )),
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
            Text("FATURA ABERTA", style: TextStyle(color: Colors.white.withAlpha(90), fontWeight: FontWeight.bold, fontSize: 22) ),
            Text("R\$ 8.178,73", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40) ),
            Text("SALDO DISPONÍVEL", style: TextStyle(color: Colors.white.withAlpha(90), fontWeight: FontWeight.bold, fontSize: 14) ),
            Text("R\$ 23.658,96", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20) ),
          ],
        ),
      ),
    );
  }
}
