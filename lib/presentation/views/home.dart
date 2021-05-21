import 'package:currency_converter/presentation/widgets/card/card.dart';
import 'package:flutter/material.dart';

class AvalaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
      child: Center(
          child: Column(
        children: [
          AvalaCard(reverseOrder: false),
          AvalaCard(reverseOrder: true)
        ],
      )),
    );
  }
}
