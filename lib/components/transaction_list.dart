import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty ? Column(
      children: <Widget>[
        SizedBox(height: 20,),
        Text(
          'Nenhuma Conta Cadastrada!',
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(height: 20,),
        Container(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png', 
            fit: BoxFit.cover,
          ),
        ),
      ],
    ) : ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = transactions[index];
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 5,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text('R\$ ${tr.value}')
                ),
              ),
            ),
            title: Text(
              tr.title,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(
              DateFormat('d MM y').format(tr.date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete), 
              color: Theme.of(context).errorColor,
              onPressed: () => onRemove(tr.id)
            ),
          ),
        );
        // return Card(
        //   child: Row(
        //     children: <Widget>[
        //       Container(
        //         margin: EdgeInsets.symmetric(
        //           horizontal: 15,
        //           vertical: 10,
        //         ),
        //         decoration: BoxDecoration(
        //             border: Border.all(
        //           color: Theme.of(context).primaryColorLight,
        //           width: 2,
        //         )),
        //         padding: EdgeInsets.all(10),
        //         child: Text(
        //           'R\$ ${tr.value.toStringAsFixed(2)}',
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20,
        //             color: Theme.of(context).primaryColor,
        //           ),
        //         ),
        //       ),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           Text(
        //             tr.title,
        //             style: Theme.of(context).textTheme.title,
        //           ),
        //           Text(
        //             DateFormat('d - MM - y').format(tr.date),
        //             style: TextStyle(
        //               fontWeight: FontWeight.w300,
        //               fontSize: 12,
        //               color: Colors.grey[600],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }
}
