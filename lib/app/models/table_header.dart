import 'package:flutter/material.dart';

class TableHeader {
  final List<String> columnNames;
  final List<int>? columnWidths;
  final double? columnHeight;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  TableHeader({
    required this.columnNames,
    this.columnWidths,
    this.columnHeight,
    this.backgroundColor,
    this.textStyle,
  });
}
