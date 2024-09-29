import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  int? sl;
  String? id;
  String? email;
  String? userId;
  String? userPassword;
  String? userType;
  String? isActive;
  String? activeRegions;
  String? regionName;
  String? empId;
  String? empName;
  String? organization;
  String? designation;
  dynamic intimes;
  String? address;
  String? deptName;
  bool? tableNativeUser;
  bool? logStatus;
  bool? hasMultipleRegionAccess;
  String? phone;
  List<dynamic>? otherPermission;
  String? mobile;
  String? regionId;
  String? organizationId;
  String? empGid;
  String? mainDeptId;
  String? departmentId;
  String? photoUrl;
  String? organizationShortName;
  String? regionShortName;
  UserModel({
    this.sl,
    this.id,
    this.email,
    this.userId,
    this.userPassword,
    this.userType,
    this.isActive,
    this.activeRegions,
    this.regionName,
    this.empId,
    this.empName,
    this.organization,
    this.designation,
    required this.intimes,
    this.address,
    this.deptName,
    this.tableNativeUser,
    this.logStatus,
    this.phone,
    this.otherPermission,
    this.mobile,
    this.regionId,
    this.organizationId,
    this.empGid,
    this.mainDeptId,
    this.departmentId,
    this.photoUrl,
    this.organizationShortName,
    this.regionShortName,
    this.hasMultipleRegionAccess,
  });

  Map<String, dynamic> toMap() {
    return {
      'sl': sl,
      'id': id,
      'email': email,
      'userId': userId,
      'userPassword': userPassword,
      'userType': userType,
      'isActive': isActive,
      'activeRegions': activeRegions,
      'regionName': regionName,
      'empId': empId,
      'empName': empName,
      'organization': organization,
      'designation': designation,
      'intimes': intimes,
      'address': address,
      'deptName': deptName,
      'tableNativeUser': tableNativeUser,
      'logStatus': logStatus,
      'phone': phone,
      'otherPermission': otherPermission,
      'mobile': mobile,
      'regionId': regionId,
      'organizationId': organizationId,
      'empGid': empGid,
      'mainDeptId': mainDeptId,
      'departmentId': departmentId,
      'photoUrl': photoUrl,
      'organizationShortName': organizationShortName,
      'regionShortName': regionShortName,
      'hasMultipleRegionAccess': hasMultipleRegionAccess,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      sl: map['sl']?.toInt(),
      id: map['id'],
      email: map['email'],
      userId: map['userId'],
      userPassword: map['userPassword'],
      userType: map['userType'],
      isActive: map['isActive'],
      activeRegions: map['activeRegions'],
      regionName: map['regionName'],
      empId: map['empId'],
      empName: map['empName'],
      organization: map['organization'],
      designation: map['designation'],
      intimes: map['intimes'],
      address: map['address'],
      deptName: map['deptName'],
      tableNativeUser: map['tableNativeUser'],
      logStatus: map['logStatus'],
      phone: map['phone'],
      otherPermission: List<dynamic>.from(map['otherPermission']),
      mobile: map['mobile'],
      regionId: map['regionId'],
      organizationId: map['organizationId'],
      empGid: map['empGid'],
      mainDeptId: map['mainDeptId'],
      departmentId: map['departmentId'],
      photoUrl: map['photoUrl'],
      organizationShortName: map['organizationShortName'],
      regionShortName: map['regionShortName'],
      hasMultipleRegionAccess: map['hasMultipleRegionAccess'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(sl: $sl, id: $id, email: $email, userId: $userId, userPassword: $userPassword, userType: $userType, isActive: $isActive, activeRegions: $activeRegions, empId: $empId, empName: $empName, organization: $organization, designation: $designation, intimes: $intimes, address: $address, deptName: $deptName, tableNativeUser: $tableNativeUser, logStatus: $logStatus, phone: $phone, otherPermission: $otherPermission, mobile: $mobile, regionId: $regionId, organizationId: $organizationId, empGid: $empGid, mainDeptId: $mainDeptId, departmentId: $departmentId, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.sl == sl &&
        other.id == id &&
        other.email == email &&
        other.userId == userId &&
        other.userPassword == userPassword &&
        other.userType == userType &&
        other.isActive == isActive &&
        other.activeRegions == activeRegions &&
        other.empId == empId &&
        other.empName == empName &&
        other.organization == organization &&
        other.designation == designation &&
        other.intimes == intimes &&
        other.address == address &&
        other.deptName == deptName &&
        other.tableNativeUser == tableNativeUser &&
        other.logStatus == logStatus &&
        other.phone == phone &&
        listEquals(other.otherPermission, otherPermission) &&
        other.mobile == mobile &&
        other.regionId == regionId &&
        other.organizationId == organizationId &&
        other.empGid == empGid &&
        other.mainDeptId == mainDeptId &&
        other.departmentId == departmentId &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return sl.hashCode ^
        id.hashCode ^
        email.hashCode ^
        userId.hashCode ^
        userPassword.hashCode ^
        userType.hashCode ^
        isActive.hashCode ^
        activeRegions.hashCode ^
        empId.hashCode ^
        empName.hashCode ^
        organization.hashCode ^
        designation.hashCode ^
        intimes.hashCode ^
        address.hashCode ^
        deptName.hashCode ^
        tableNativeUser.hashCode ^
        logStatus.hashCode ^
        phone.hashCode ^
        otherPermission.hashCode ^
        mobile.hashCode ^
        regionId.hashCode ^
        organizationId.hashCode ^
        empGid.hashCode ^
        mainDeptId.hashCode ^
        departmentId.hashCode ^
        photoUrl.hashCode;
  }
}
