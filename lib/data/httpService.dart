import 'dart:convert';

import 'package:currency_converter/data/model/Symbols.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HttpService {
  final String symbolsUrl =
      'https://api.exchangeratesapi.io/v1/symbols ? access_key = 4eef2826ed9f8ff03b08357418e4e2f3';

  Future<List<Symbols>> getSymbols() async {
    Response res = await get(Uri.parse(symbolsUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(body);
      List<Symbols> symbols = body
          .map(
            (dynamic item) => Symbols.fromJson(item),
          )
          .toList();
      return symbols;
    } else {
      throw "Unalbe to retrieve symbols.";
    }
  }
}
