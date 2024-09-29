// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AttendenceSubmissionModel {
  String? empId;
  String? attnType;
  String? outTime;
  String? outComments;
  String? inLocation;
  String? outLocation;
  String? atnDate;
  String? inTime;
  AttendenceSubmissionModel({
    this.empId,
    this.attnType,
    this.outTime,
    this.outComments,
    this.inLocation,
    this.outLocation,
    this.atnDate,
    this.inTime,
  });

  AttendenceSubmissionModel copyWith({
    String? empId,
    String? attnType,
    String? outTime,
    String? outComments,
    String? inLocation,
    String? outLocation,
    String? atnDate,
    String? inTime,
  }) {
    return AttendenceSubmissionModel(
      empId: empId ?? this.empId,
      attnType: attnType ?? this.attnType,
      outTime: outTime ?? this.outTime,
      outComments: outComments ?? this.outComments,
      inLocation: inLocation ?? this.inLocation,
      outLocation: outLocation ?? this.outLocation,
      atnDate: atnDate ?? this.atnDate,
      inTime: inTime ?? this.inTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'empId': empId,
      'attnType': attnType,
      'outTime': outTime,
      'outComments': outComments,
      'inLocation': inLocation,
      'outLocation': outLocation,
      'atnDate': atnDate,
      'inTime': inTime,
    };
  }

  factory AttendenceSubmissionModel.fromMap(Map<String, dynamic> map) {
    return AttendenceSubmissionModel(
      empId: map['empId'] != null ? map['empId'] as String : null,
      attnType: map['attnType'] != null ? map['attnType'] as String : null,
      outTime: map['outTime'] != null ? map['outTime'] as String : null,
      outComments:
          map['outComments'] != null ? map['outComments'] as String : null,
      inLocation:
          map['inLocation'] != null ? map['inLocation'] as String : null,
      outLocation:
          map['outLocation'] != null ? map['outLocation'] as String : null,
      atnDate: map['atnDate'] != null ? map['atnDate'] as String : null,
      inTime: map['inTime'] != null ? map['inTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendenceSubmissionModel.fromJson(String source) =>
      AttendenceSubmissionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AttendenceSubmissionModel(empId: $empId, attnType: $attnType, outTime: $outTime, outComments: $outComments, inLocation: $inLocation, outLocation: $outLocation, atnDate: $atnDate, inTime: $inTime)';
  }

  @override
  bool operator ==(covariant AttendenceSubmissionModel other) {
    if (identical(this, other)) return true;

    return other.empId == empId &&
        other.attnType == attnType &&
        other.outTime == outTime &&
        other.outComments == outComments &&
        other.inLocation == inLocation &&
        other.outLocation == outLocation &&
        other.atnDate == atnDate &&
        other.inTime == inTime;
  }

  @override
  int get hashCode {
    return empId.hashCode ^
        attnType.hashCode ^
        outTime.hashCode ^
        outComments.hashCode ^
        inLocation.hashCode ^
        outLocation.hashCode ^
        atnDate.hashCode ^
        inTime.hashCode;
  }
}
