import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    String dropdownValue = 'Australian Dollar';
    return Container(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(widget.symbol,
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                )),
            DropdownButton(
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 0,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    newValue!;
                  });
                },
                value: dropdownValue,
                items: <String>[
                  'Australian Dollar',
                  'Central African Franc',
                  'United State Dollar',
                  'Chinese Yen'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontWeight: FontWeight.w600),
                    ),
                  );
                }).toList())
          ])
        ],
      ),
    );
  }
}
