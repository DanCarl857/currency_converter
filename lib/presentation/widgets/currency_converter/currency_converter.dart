import 'package:currency_converter/presentation/widgets/card/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final baseCurrencyTextController = TextEditingController();
  late Map symbols = {};
  String baseCurrency = "USD";
  String sourceCurrency = "GBP";
  late String result = "";
  String currencyVal = "USD:United States Dollar";
  List<DropdownMenuItem<String>> menuItems = [];

  @override
  void initState() {
    super.initState();
    _getSymbols();
  }

  Future<String> _getSymbols() async {
    String symbolsUrl =
        "http://api.exchangeratesapi.io/symbols?access_key=4eef2826ed9f8ff03b08357418e4e2f3";
    var response = await http
        .get(Uri.parse(symbolsUrl), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body)['symbols'];
    Map symbolsMap = responseBody;
    print(symbolsMap);
    symbols = symbolsMap;
    for (String key in symbolsMap.keys) {
      menuItems.add(DropdownMenuItem<String>(
        // items[key] this instruction get the value of the respective key
        child: Container(
          width: 180,
          child: Text(
            symbolsMap[key],
            style: TextStyle(color: Colors.blueGrey[900]),
          ),
        ), // the value as text label
        value: "$key:" + symbolsMap[key], // the respective key as value
      ));
    }
    setState(() {});
    return "Success";
  }

  Future<String> _doConversion() async {
    String uri =
        "http://api.exchangeratesapi.io/v1/latest?access_key=4eef2826ed9f8ff03b08357418e4e2f3&symbols=$sourceCurrency,$baseCurrency";
    print(baseCurrency);
    var response =
        await http.get(Uri.parse(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    print(responseBody);
    setState(() {
      result = ((double.parse(baseCurrencyTextController.text) /
                  responseBody["rates"][baseCurrency]) *
              (responseBody["rates"][sourceCurrency]))
          .toStringAsFixed(2);
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
      ),
      body: symbols.length == 0
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      AvalaCard(
                          reverseOrder: true,
                          currencyVal: currencyVal,
                          menuItems: menuItems,
                          category: baseCurrency,
                          sourceCurrency: sourceCurrency,
                          baseCurrency: baseCurrency),
                      SizedBox(
                        height: 20,
                      ),
                      AvalaCard(
                          reverseOrder: false,
                          currencyVal: currencyVal,
                          menuItems: menuItems,
                          category: sourceCurrency,
                          sourceCurrency: sourceCurrency,
                          baseCurrency: baseCurrency)
                    ],
                  )),
            ),
    );
  }
}
