import 'package:currency_converter/presentation/widgets/price/price.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final baseCurrencyTextController = TextEditingController(text: '0');
  late Map symbols = {};
  String baseCurrency = "USD";
  String sourceCurrency = "GBP";
  late String result = "0";
  String currencyVal = "USD:United States Dollar";
  String toCurrencyVal = "GBP:British Pound Sterling";
  List<DropdownMenuItem<String>> menuItems = [];
  bool isInput = false;

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
    symbols = symbolsMap;

    setState(() {});
    return "Success";
  }

  Future<String> _doConversion() async {
    String uri =
        "http://api.exchangeratesapi.io/v1/latest?access_key=4eef2826ed9f8ff03b08357418e4e2f3&symbols=$sourceCurrency,$baseCurrency";
    var response =
        await http.get(Uri.parse(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    setState(() {
      result = ((double.parse(baseCurrencyTextController.text) /
                  responseBody["rates"][baseCurrency]) *
              (responseBody["rates"][sourceCurrency]))
          .toStringAsFixed(2);
      isInput = false;
    });
    return "Success";
  }

  _switchCurrencies() {
    print(sourceCurrency);
    print(baseCurrency);
    var tempCurrency = baseCurrency;
    var tempAbr = currencyVal;
    setState(() {
      currencyVal = toCurrencyVal;
      toCurrencyVal = tempAbr;
      baseCurrency = sourceCurrency;
      sourceCurrency = tempCurrency;
    });
  }

  _onBaseCurrencyChanged(String? value) {
    setState(() {
      baseCurrency = value!;
    });
  }

  currencyState(String? value) {
    setState(() {
      currencyVal = value!;
    });
  }

  toCurrencyState(String? value) {
    setState(() {
      toCurrencyVal = value!;
    });
  }

  _onSourceCurrencyChanged(String? value) {
    setState(() {
      sourceCurrency = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        elevation: 0,
      ),
      body: symbols.length == 0
          ? Center(
              child: Wrap(children: [
              CircularProgressIndicator(),
              Text('  Getting symbols...')
            ]))
          : Container(
              // height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey.shade400.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3))
                              ]),
                          child: Card(
                              elevation: 0,
                              child: Padding(
                                  padding: EdgeInsets.all(25),
                                  child: Column(
                                    children: [
                                      Wrap(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              baseCurrency,
                                              style: TextStyle(
                                                color: Colors.blueGrey[900],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            new DisplayDropDown(
                                                symbols,
                                                currencyVal,
                                                toCurrencyVal,
                                                "fromConversion",
                                                currencyState,
                                                toCurrencyState,
                                                _onBaseCurrencyChanged,
                                                _onSourceCurrencyChanged)
                                          ],
                                        ),
                                        Container(
                                            child: isInput
                                                ? TextField(
                                                    controller:
                                                        baseCurrencyTextController,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isInput = true;
                                                      });
                                                    },
                                                    child: AvalaPrice(
                                                        value: double.parse(
                                                            baseCurrencyTextController
                                                                .text),
                                                        symbol: baseCurrency),
                                                  )),
                                        Row(
                                          children: [
                                            Text('Tap here to input a value...',
                                                style: TextStyle(
                                                    color: Colors.grey.shade600,
                                                    fontStyle:
                                                        FontStyle.italic))
                                          ],
                                        )
                                      ])
                                    ],
                                  )))),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Center(
                            child: FloatingActionButton(
                                backgroundColor: Colors.indigo.shade100,
                                child: Icon(Icons.compare_arrows),
                                elevation: 0.1,
                                onPressed: _switchCurrencies)),
                      ]),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey.shade400.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3))
                              ]),
                          child: Card(
                              elevation: 0,
                              child: Padding(
                                  padding: EdgeInsets.all(25),
                                  child: Column(
                                    children: [
                                      Wrap(children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline:
                                              TextBaseline.ideographic,
                                          children: [
                                            AvalaPrice(
                                                value: double.parse(result),
                                                symbol: sourceCurrency)
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              sourceCurrency,
                                              style: TextStyle(
                                                color: Colors.blueGrey[900],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            new DisplayDropDown(
                                                symbols,
                                                currencyVal,
                                                toCurrencyVal,
                                                "toConversion",
                                                currencyState,
                                                toCurrencyState,
                                                _onBaseCurrencyChanged,
                                                _onSourceCurrencyChanged)
                                          ],
                                        )
                                      ])
                                    ],
                                  )))),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple.shade900, // background
                              onPrimary: Colors.white,
                              shape: StadiumBorder() // foreground
                              ),
                          onPressed: _doConversion,
                          child: Text('Do Conversion'),
                        ),
                      )
                    ],
                  )),
            ),
    );
  }
}

class DisplayDropDown extends StatelessWidget {
  final Map symbolsMap;
  final String currencyCategory;
  final void Function(String) state;
  final void Function(String) toState;
  final void Function(String) _onBaseCurrencyChanged;
  final void Function(String) _onSourceCurrencyChanged;
  final List<DropdownMenuItem<String>> menuItem = [];
  final String currencyVal;
  final String toCurrencyVal;

  DisplayDropDown(
      this.symbolsMap,
      this.currencyVal,
      this.toCurrencyVal,
      this.currencyCategory,
      this.state,
      this.toState,
      this._onBaseCurrencyChanged,
      this._onSourceCurrencyChanged);

  @override
  Widget build(BuildContext context) {
    for (String key in symbolsMap.keys) {
      menuItem.add(DropdownMenuItem<String>(
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
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            items: menuItem,
            value: currencyCategory == "fromConversion"
                ? currencyVal
                : toCurrencyVal,
            onChanged: (String? value) {
              if (value.runtimeType == String) {
                if (currencyCategory == "fromConversion") {
                  List idxName = value!.split(":");
                  state(value);
                  _onBaseCurrencyChanged(idxName[0]);
                }

                if (currencyCategory == "toConversion") {
                  List idxName = value!.split(":");
                  toState(value);
                  _onSourceCurrencyChanged(idxName[0]);
                }
              }
            }));
  }
}
