// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SSPApprovalDetailsModel {
  String? id;
  String? reqID;
  String? reqLeaveType;
  String? reqLeaveFrom;
  String? reqLeaveTo;
  String? reqLeaveDays;
  String? reqLeaveHours;
  String? leavePurpose;
  String? leaveAddress;
  String? leaveContact;
  String? leaveDocPath;
  String? responsibleEmp;
  String? responsibleName;
  String? lvTypeName;
  SSPApprovalDetailsModel({
    this.id,
    this.reqID,
    this.reqLeaveType,
    this.reqLeaveFrom,
    this.reqLeaveTo,
    this.reqLeaveDays,
    this.reqLeaveHours,
    this.leavePurpose,
    this.leaveAddress,
    this.leaveContact,
    this.leaveDocPath,
    this.responsibleEmp,
    this.responsibleName,
    this.lvTypeName,
  });

  SSPApprovalDetailsModel copyWith({
    String? id,
    String? reqID,
    String? reqLeaveType,
    String? reqLeaveFrom,
    String? reqLeaveTo,
    String? reqLeaveDays,
    String? reqLeaveHours,
    String? leavePurpose,
    String? leaveAddress,
    String? leaveContact,
    String? leaveDocPath,
    String? responsibleEmp,
    String? responsibleName,
    String? lvTypeName,
  }) {
    return SSPApprovalDetailsModel(
      id: id ?? this.id,
      reqID: reqID ?? this.reqID,
      reqLeaveType: reqLeaveType ?? this.reqLeaveType,
      reqLeaveFrom: reqLeaveFrom ?? this.reqLeaveFrom,
      reqLeaveTo: reqLeaveTo ?? this.reqLeaveTo,
      reqLeaveDays: reqLeaveDays ?? this.reqLeaveDays,
      reqLeaveHours: reqLeaveHours ?? this.reqLeaveHours,
      leavePurpose: leavePurpose ?? this.leavePurpose,
      leaveAddress: leaveAddress ?? this.leaveAddress,
      leaveContact: leaveContact ?? this.leaveContact,
      leaveDocPath: leaveDocPath ?? this.leaveDocPath,
      responsibleEmp: responsibleEmp ?? this.responsibleEmp,
      responsibleName: responsibleName ?? this.responsibleName,
      lvTypeName: lvTypeName ?? this.lvTypeName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'reqID': reqID,
      'reqLeaveType': reqLeaveType,
      'reqLeaveFrom': reqLeaveFrom,
      'reqLeaveTo': reqLeaveTo,
      'reqLeaveDays': reqLeaveDays,
      'reqLeaveHours': reqLeaveHours,
      'leavePurpose': leavePurpose,
      'leaveAddress': leaveAddress,
      'leaveContact': leaveContact,
      'leaveDocPath': leaveDocPath,
      'responsibleEmp': responsibleEmp,
      'responsibleName': responsibleName,
      'lvTypeName': lvTypeName,
    };
  }

  factory SSPApprovalDetailsModel.fromMap(Map<String, dynamic> map) {
    return SSPApprovalDetailsModel(
      id: map['id'] != null ? map['id'] as String : null,
      reqID: map['reqID'] != null ? map['reqID'] as String : null,
      reqLeaveType:
          map['reqLeaveType'] != null ? map['reqLeaveType'] as String : null,
      reqLeaveFrom:
          map['reqLeaveFrom'] != null ? map['reqLeaveFrom'] as String : null,
      reqLeaveTo:
          map['reqLeaveTo'] != null ? map['reqLeaveTo'] as String : null,
      reqLeaveDays:
          map['reqLeaveDays'] != null ? map['reqLeaveDays'] as String : null,
      reqLeaveHours:
          map['reqLeaveHours'] != null ? map['reqLeaveHours'] as String : null,
      leavePurpose:
          map['leavePurpose'] != null ? map['leavePurpose'] as String : null,
      leaveAddress:
          map['leaveAddress'] != null ? map['leaveAddress'] as String : null,
      leaveContact:
          map['leaveContact'] != null ? map['leaveContact'] as String : null,
      leaveDocPath:
          map['leaveDocPath'] != null ? map['leaveDocPath'] as String : null,
      responsibleEmp: map['responsibleEmp'] != null
          ? map['responsibleEmp'] as String
          : null,
      responsibleName: map['responsibleName'] != null
          ? map['responsibleName'] as String
          : null,
      lvTypeName:
          map['lvTypeName'] != null ? map['lvTypeName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SSPApprovalDetailsModel.fromJson(String source) =>
      SSPApprovalDetailsModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SSPApprovalDetailsModel(id: $id, reqID: $reqID, reqLeaveType: $reqLeaveType, reqLeaveFrom: $reqLeaveFrom, reqLeaveTo: $reqLeaveTo, reqLeaveDays: $reqLeaveDays, reqLeaveHours: $reqLeaveHours, leavePurpose: $leavePurpose, leaveAddress: $leaveAddress, leaveContact: $leaveContact, leaveDocPath: $leaveDocPath, responsibleEmp: $responsibleEmp, responsibleName: $responsibleName, lvTypeName: $lvTypeName)';
  }

  @override
  bool operator ==(covariant SSPApprovalDetailsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.reqID == reqID &&
        other.reqLeaveType == reqLeaveType &&
        other.reqLeaveFrom == reqLeaveFrom &&
        other.reqLeaveTo == reqLeaveTo &&
        other.reqLeaveDays == reqLeaveDays &&
        other.reqLeaveHours == reqLeaveHours &&
        other.leavePurpose == leavePurpose &&
        other.leaveAddress == leaveAddress &&
        other.leaveContact == leaveContact &&
        other.leaveDocPath == leaveDocPath &&
        other.responsibleEmp == responsibleEmp &&
        other.responsibleName == responsibleName &&
        other.lvTypeName == lvTypeName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        reqID.hashCode ^
        reqLeaveType.hashCode ^
        reqLeaveFrom.hashCode ^
        reqLeaveTo.hashCode ^
        reqLeaveDays.hashCode ^
        reqLeaveHours.hashCode ^
        leavePurpose.hashCode ^
        leaveAddress.hashCode ^
        leaveContact.hashCode ^
        leaveDocPath.hashCode ^
        responsibleEmp.hashCode ^
        responsibleName.hashCode ^
        lvTypeName.hashCode;
  }
}
