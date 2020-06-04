import 'package:flutter/material.dart';

class DustmanWallet extends StatelessWidget {
  final int money;
  DustmanWallet({this.money});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'You have $money\$',
          style: TextStyle(
            color: Colors.deepOrange.withBlue(3),
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}