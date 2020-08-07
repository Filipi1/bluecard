import 'package:creditcard/models/transaction.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String value;
  final String dateTime;
  final int parcels;
  final IconData icon;

  TransactionTile({@required this.title, @required this.value, @required this.dateTime, this.parcels = 1, this.icon = FontAwesomeIcons.shoppingBag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                  Row(
                    children: <Widget>[
                      Text(value),
                      SizedBox(width: 5,),
                      parcels > 1 ? Text("(x $parcels)", style: TextStyle(color: Colors.black45),) : Text("")
                    ],
                  ),
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

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (transactions.length * 120).toDouble(),

      child: ListView.builder(
        physics: ScrollPhysics(),
        itemBuilder: (_, index) => TransactionTile(
            title: transactions[index]?.name,
            value: transactions[index]?.value,
            dateTime: transactions[index].operationDate != null ? transactions[index].operationDate : "Não Computado",
            parcels: transactions[index]?.parcels
        ),
        itemCount: transactions.length,
      ),
    );
  }
}