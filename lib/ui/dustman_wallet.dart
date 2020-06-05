import 'package:flutter/material.dart';

class DustmanWallet extends StatelessWidget {
  final double money;
  DustmanWallet({this.money});

  @override
  Widget build(BuildContext context) {
    return Text(
      'You have $money\$',
      style: TextStyle(
        color: Colors.deepOrange.withBlue(3),
        fontSize: 20.0,
      ),
    );
  }
}