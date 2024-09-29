import 'dart:convert';

import 'package:flutter/material.dart';

class AttendanceChartModel {
  String titile;
  double percentage;
  Color color;
  AttendanceChartModel({
    required this.titile,
    required this.percentage,
    required this.color,
  });

  AttendanceChartModel copyWith({
    String? titile,
    double? percentage,
    Color? color,
  }) {
    return AttendanceChartModel(
      titile: titile ?? this.titile,
      percentage: percentage ?? this.percentage,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titile': titile,
      'percentage': percentage,
      'color': color.value,
    };
  }

  factory AttendanceChartModel.fromMap(Map<String, dynamic> map) {
    return AttendanceChartModel(
      titile: map['titile'] ?? '',
      percentage: map['percentage']?.toDouble() ?? 0.0,
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceChartModel.fromJson(String source) =>
      AttendanceChartModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AttendanceChartModel(titile: $titile, percentage: $percentage, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AttendanceChartModel &&
        other.titile == titile &&
        other.percentage == percentage &&
        other.color == color;
  }

  @override
  int get hashCode => titile.hashCode ^ percentage.hashCode ^ color.hashCode;
}
