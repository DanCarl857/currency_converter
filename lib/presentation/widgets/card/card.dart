import 'package:currency_converter/presentation/widgets/currency/currency.dart';
import 'package:currency_converter/presentation/widgets/price/price.dart';
import 'package:flutter/material.dart';

class AvalaCard extends StatefulWidget {
  final bool reverseOrder;
  String currencyVal;
  List<DropdownMenuItem<String>> menuItems = [];
  String baseCurrency;
  String sourceCurrency;
  String category;
  AvalaCard(
      {Key? key,
      required this.reverseOrder,
      required this.currencyVal,
      required this.menuItems,
      required this.sourceCurrency,
      required this.category,
      required this.baseCurrency})
      : super(key: key);

  @override
  _AvalaCardState createState() => _AvalaCardState();
}

class _AvalaCardState extends State<AvalaCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    widget.reverseOrder
                        ? Wrap(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.baseCurrency,
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                _displayDropDown(widget.category)
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  widget.baseCurrency,
                                  style: TextStyle(
                                      color: Colors.deepPurple[500],
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '100.00',
                                  style: TextStyle(
                                      color: Colors.deepPurple[500],
                                      fontSize: 50,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            )
                          ])
                        : Wrap(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  widget.sourceCurrency,
                                  style: TextStyle(
                                      color: Colors.deepPurple[500],
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  '100.00',
                                  style: TextStyle(
                                      color: Colors.deepPurple[500],
                                      fontSize: 50,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.sourceCurrency,
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                _displayDropDown(widget.category)
                              ],
                            )
                          ])
                  ],
                ))));
  }

  _onBaseCurrencyChanged(String? value) {
    setState(() {
      widget.baseCurrency = value!;
    });
  }

  _onSourceCurrencyChanged(String? value) {
    setState(() {
      widget.sourceCurrency = value!;
    });
  }

  Widget _displayDropDown(String currencyCategory) {
    return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            items: widget.menuItems,
            value: widget.currencyVal,
            onChanged: (String? value) {
              if (value.runtimeType == String) {
                List idxName = value!.split(":");
                setState(() {
                  widget.currencyVal = value;
                });
                print(currencyCategory);
                if (currencyCategory == widget.baseCurrency) {
                  _onBaseCurrencyChanged(idxName[0]);
                } else {
                  _onSourceCurrencyChanged(idxName[0]);
                }
              }
            }));
  }
}
