import 'package:flutter/material.dart';

class AvalaPrice extends StatefulWidget {
  final int value;
  final String symbol;
  AvalaPrice({Key? key, required this.value, required this.symbol});

  @override
  _AvalaPriceState createState() => _AvalaPriceState();
}

class _AvalaPriceState extends State<AvalaPrice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Text(
          widget.symbol + ' ',
          style: TextStyle(
              color: Colors.deepPurple[500],
              fontSize: 25,
              fontWeight: FontWeight.w300),
        ),
        Text(
          widget.value.toString(),
          style: TextStyle(
              color: Colors.deepPurple[500],
              fontSize: 50,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
