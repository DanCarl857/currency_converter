import 'package:flutter/material.dart';

class AvalaCurrency extends StatefulWidget {
  final String symbol;
  final String name;
  AvalaCurrency({Key? key, required this.symbol, required this.name})
      : super(key: key);

  @override
  _AvalaCurrencyState createState() => _AvalaCurrencyState();
}

class _AvalaCurrencyState extends State<AvalaCurrency> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(widget.symbol,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
            Text(
              widget.name,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            )
          ])
        ],
      ),
    );
  }
}
