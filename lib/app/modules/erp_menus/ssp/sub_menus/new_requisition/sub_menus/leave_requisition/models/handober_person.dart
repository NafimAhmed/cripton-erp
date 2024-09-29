// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HandoberPersonModel {
  String? id;
  String? managerName;
  String? managerId;
  String? empCode;
  String? empName;
  String? gender;
  String? emailaddress;
  String? status;
  String? statusDate;
  String? managerEmpCode;
  String? comid;
  String? comCode;
  String? comName;
  String? comSName;
  String? locid;
  String? locCode;
  String? locName;
  String? locSName;
  String? depid;
  String? depCode;
  String? depName;
  String? secid;
  String? secCode;
  String? secName;
  String? designation;
  String? jobTitle;
  String? mobile;
  String label;
  HandoberPersonModel({
    this.id,
    this.managerName,
    this.managerId,
    this.empCode,
    this.empName,
    this.gender,
    this.emailaddress,
    this.status,
    this.statusDate,
    this.managerEmpCode,
    this.comid,
    this.comCode,
    this.comName,
    this.comSName,
    this.locid,
    this.locCode,
    this.locName,
    this.locSName,
    this.depid,
    this.depCode,
    this.depName,
    this.secid,
    this.secCode,
    this.secName,
    this.designation,
    this.jobTitle,
    this.mobile,
    required this.label,
  });

  HandoberPersonModel copyWith({
    String? id,
    String? managerName,
    String? managerId,
    String? empCode,
    String? empName,
    String? gender,
    String? emailaddress,
    String? status,
    String? statusDate,
    String? managerEmpCode,
    String? comid,
    String? comCode,
    String? comName,
    String? comSName,
    String? locid,
    String? locCode,
    String? locName,
    String? locSName,
    String? depid,
    String? depCode,
    String? depName,
    String? secid,
    String? secCode,
    String? secName,
    String? designation,
    String? jobTitle,
    String? mobile,
  }) {
    return HandoberPersonModel(
      id: id ?? this.id,
      managerName: managerName ?? this.managerName,
      managerId: managerId ?? this.managerId,
      empCode: empCode ?? this.empCode,
      empName: empName ?? this.empName,
      gender: gender ?? this.gender,
      emailaddress: emailaddress ?? this.emailaddress,
      status: status ?? this.status,
      statusDate: statusDate ?? this.statusDate,
      managerEmpCode: managerEmpCode ?? this.managerEmpCode,
      comid: comid ?? this.comid,
      comCode: comCode ?? this.comCode,
      comName: comName ?? this.comName,
      comSName: comSName ?? this.comSName,
      locid: locid ?? this.locid,
      locCode: locCode ?? this.locCode,
      locName: locName ?? this.locName,
      locSName: locSName ?? this.locSName,
      depid: depid ?? this.depid,
      depCode: depCode ?? this.depCode,
      depName: depName ?? this.depName,
      secid: secid ?? this.secid,
      secCode: secCode ?? this.secCode,
      secName: secName ?? this.secName,
      designation: designation ?? this.designation,
      jobTitle: jobTitle ?? this.jobTitle,
      mobile: mobile ?? this.mobile,
      label: empName ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'managerName': managerName,
      'managerId': managerId,
      'empCode': empCode,
      'empName': empName,
      'gender': gender,
      'emailaddress': emailaddress,
      'status': status,
      'statusDate': statusDate,
      'managerEmpCode': managerEmpCode,
      'comid': comid,
      'comCode': comCode,
      'comName': comName,
      'comSName': comSName,
      'locid': locid,
      'locCode': locCode,
      'locName': locName,
      'locSName': locSName,
      'depid': depid,
      'depCode': depCode,
      'depName': depName,
      'secid': secid,
      'secCode': secCode,
      'secName': secName,
      'designation': designation,
      'jobTitle': jobTitle,
      'mobile': mobile,
    };
  }

  factory HandoberPersonModel.fromMap(Map<String, dynamic> map) {
    return HandoberPersonModel(
      id: map['id'] != null ? map['id'] as String : null,
      managerName:
          map['managerName'] != null ? map['managerName'] as String : null,
      managerId: map['managerId'] != null ? map['managerId'] as String : null,
      empCode: map['empCode'] != null ? map['empCode'] as String : null,
      empName: map['empName'] != null ? map['empName'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      emailaddress:
          map['emailaddress'] != null ? map['emailaddress'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      statusDate:
          map['statusDate'] != null ? map['statusDate'] as String : null,
      managerEmpCode: map['managerEmpCode'] != null
          ? map['managerEmpCode'] as String
          : null,
      comid: map['comid'] != null ? map['comid'] as String : null,
      comCode: map['comCode'] != null ? map['comCode'] as String : null,
      comName: map['comName'] != null ? map['comName'] as String : null,
      comSName: map['comSName'] != null ? map['comSName'] as String : null,
      locid: map['locid'] != null ? map['locid'] as String : null,
      locCode: map['locCode'] != null ? map['locCode'] as String : null,
      locName: map['locName'] != null ? map['locName'] as String : null,
      locSName: map['locSName'] != null ? map['locSName'] as String : null,
      depid: map['depid'] != null ? map['depid'] as String : null,
      depCode: map['depCode'] != null ? map['depCode'] as String : null,
      depName: map['depName'] != null ? map['depName'] as String : null,
      secid: map['secid'] != null ? map['secid'] as String : null,
      secCode: map['secCode'] != null ? map['secCode'] as String : null,
      secName: map['secName'] != null ? map['secName'] as String : null,
      designation:
          map['designation'] != null ? map['designation'] as String : null,
      jobTitle: map['jobTitle'] != null ? map['jobTitle'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      label: map['empName'] != null ? map['empName'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HandoberPersonModel.fromJson(String source) =>
      HandoberPersonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '$empName';
  }

  String toLowerCase() {
    return empName ?? '';
  }

  @override
  bool operator ==(covariant HandoberPersonModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.managerName == managerName &&
        other.managerId == managerId &&
        other.empCode == empCode &&
        other.empName == empName &&
        other.gender == gender &&
        other.emailaddress == emailaddress &&
        other.status == status &&
        other.statusDate == statusDate &&
        other.managerEmpCode == managerEmpCode &&
        other.comid == comid &&
        other.comCode == comCode &&
        other.comName == comName &&
        other.comSName == comSName &&
        other.locid == locid &&
        other.locCode == locCode &&
        other.locName == locName &&
        other.locSName == locSName &&
        other.depid == depid &&
        other.depCode == depCode &&
        other.depName == depName &&
        other.secid == secid &&
        other.secCode == secCode &&
        other.secName == secName &&
        other.designation == designation &&
        other.jobTitle == jobTitle &&
        other.mobile == mobile;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        managerName.hashCode ^
        managerId.hashCode ^
        empCode.hashCode ^
        empName.hashCode ^
        gender.hashCode ^
        emailaddress.hashCode ^
        status.hashCode ^
        statusDate.hashCode ^
        managerEmpCode.hashCode ^
        comid.hashCode ^
        comCode.hashCode ^
        comName.hashCode ^
        comSName.hashCode ^
        locid.hashCode ^
        locCode.hashCode ^
        locName.hashCode ^
        locSName.hashCode ^
        depid.hashCode ^
        depCode.hashCode ^
        depName.hashCode ^
        secid.hashCode ^
        secCode.hashCode ^
        secName.hashCode ^
        designation.hashCode ^
        jobTitle.hashCode ^
        mobile.hashCode;
  }
}
