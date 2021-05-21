import 'package:currency_converter/presentation/views/home.dart';
import 'package:currency_converter/presentation/widgets/card/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(CurrencyConverter());

class CurrencyConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.purple.shade900),
        home: Scaffold(
            appBar: AppBar(title: Text('Currency Converter')),
            body: AvalaHome()));
  }
}
