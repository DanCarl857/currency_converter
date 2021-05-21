import 'package:currency_converter/presentation/widgets/currency/currency.dart';
import 'package:currency_converter/presentation/widgets/price/price.dart';
import 'package:flutter/material.dart';

class AvalaCard extends StatefulWidget {
  final bool reverseOrder;
  AvalaCard({Key? key, required this.reverseOrder}) : super(key: key);

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
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    widget.reverseOrder
                        ? Wrap(children: [
                            AvalaCurrency(
                                symbol: '\$ AUD', name: 'Australian Dollar'),
                            SizedBox(
                              height: 20,
                            ),
                            AvalaPrice(
                              value: 100,
                              symbol: '\$',
                            )
                          ])
                        : Wrap(children: [
                            AvalaPrice(
                              value: 50000,
                              symbol: 'FCFA',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AvalaCurrency(
                                symbol: 'FCFA', name: 'Central African Franc'),
                          ])
                  ],
                ))));
  }
}
