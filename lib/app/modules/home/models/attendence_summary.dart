// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AttendenceSummaryModel {
  double? presentPercent;
  double? leavePercent;
  double? holidayPercent;
  double? absentPercent;
  AttendenceSummaryModel({
    this.presentPercent,
    this.leavePercent,
    this.holidayPercent,
    this.absentPercent,
  });

  AttendenceSummaryModel copyWith({
    double? presentPercent,
    double? leavePercent,
    double? holidayPercent,
    double? absentPercent,
  }) {
    return AttendenceSummaryModel(
      presentPercent: presentPercent ?? this.presentPercent,
      leavePercent: leavePercent ?? this.leavePercent,
      holidayPercent: holidayPercent ?? this.holidayPercent,
      absentPercent: absentPercent ?? this.absentPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'presentPercent': presentPercent,
      'leavePercent': leavePercent,
      'holidayPercent': holidayPercent,
      'absentPercent': absentPercent,
    };
  }

  factory AttendenceSummaryModel.fromMap(Map<String, dynamic> map) {
    return AttendenceSummaryModel(
      presentPercent: map['presentPercent'] != null
          ? double.parse(map['presentPercent'].toString())
          : null,
      leavePercent: map['leavePercent'] != null
          ? double.parse(map['leavePercent'].toString())
          : null,
      holidayPercent: map['holidayPercent'] != null
          ? double.parse(map['holidayPercent'].toString())
          : null,
      absentPercent: map['absentPercent'] != null
          ? double.parse(map['absentPercent'].toString())
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendenceSummaryModel.fromJson(String source) =>
      AttendenceSummaryModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AttendenceSummaryModel(presentPercent: $presentPercent, leavePercent: $leavePercent, holidayPercent: $holidayPercent, absentPercent: $absentPercent)';
  }

  @override
  bool operator ==(covariant AttendenceSummaryModel other) {
    if (identical(this, other)) return true;

    return other.presentPercent == presentPercent &&
        other.leavePercent == leavePercent &&
        other.holidayPercent == holidayPercent &&
        other.absentPercent == absentPercent;
  }

  @override
  int get hashCode {
    return presentPercent.hashCode ^
        leavePercent.hashCode ^
        holidayPercent.hashCode ^
        absentPercent.hashCode;
  }
}
