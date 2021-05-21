import 'package:flutter/material.dart';

void main() => runApp(CurrencyConverter());

class CurrencyConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple.shade900),
        home: Scaffold(
            appBar: AppBar(title: Text('Currency Converter')),
            body: Container(
                margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
                child: Center(
                    child: Column(
                  children: [
                    Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$ AUD',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                      'Australian Dollar',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Text(
                                      '\$',
                                      style: TextStyle(
                                          color: Colors.deepPurple[500],
                                          fontSize: 20),
                                    ),
                                    Text(
                                      '100.00',
                                      style: TextStyle(
                                          color: Colors.deepPurple[500],
                                          fontSize: 35),
                                    )
                                  ],
                                )
                              ],
                            ))),
                    Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Text(
                                      '\FCFA',
                                      style: TextStyle(
                                          color: Colors.deepPurple[500],
                                          fontSize: 20),
                                    ),
                                    Text(
                                      '100.00',
                                      style: TextStyle(
                                          color: Colors.deepPurple[500],
                                          fontSize: 35),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('FCFA',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                      'Central African Franc',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ],
                            ))),
                  ],
                )))));
  }
}
