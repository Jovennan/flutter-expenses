import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double value;
  final double percentage;

  const ChartBar({this.label, this.value, this.percentage}); //, this.totalSum);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('R\$ ${value.toStringAsFixed(2)}'),
        SizedBox(height: 5,),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor,
                ),),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Text(label),
      ],
    );
  }
}