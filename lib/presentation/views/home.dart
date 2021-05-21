import 'package:currency_converter/presentation/widgets/currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';

class AvalaHome extends StatefulWidget {
  @override
  _AvalaHomeState createState() => _AvalaHomeState();
}

class _AvalaHomeState extends State<AvalaHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: CurrencyConverter()),
    );
  }
}
