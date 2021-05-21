import 'package:flutter/material.dart';

class Symbols {
  final bool success;
  final Map symbols;

  Symbols({required this.success, required this.symbols});

  factory Symbols.fromJson(Map<String, dynamic> json) {
    return Symbols(success: json['success'], symbols: json['symbols']);
  }
}
