// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmployeeModel {
  String? id;
  String? email;
  String? userId;
  String? userPassword;
  String? userType;
  String? isActive;
  String? activeRegions;
  String? empID;
  String? empName;
  String? organization;
  String? designation;
  String? depName;
  String? intimes;
  String? address;
  String? emailaddress;
  String? deptName;
  bool? tableNativeUser;
  bool? logStatus;
  String? phone;
  String? otherPermission;
  String? mobile;
  String? regionName;
  String? mainDepartmentName;
  String? managerId;
  String? manager;
  String? regionId;
  String? organizationId;
  String? empGID;
  String? mainDeptId;
  String? departmentId;
  String? photoUrl;
  String? signUrl;
  String? updated_By;
  String? updated_Date;
  EmployeeModel({
    this.id,
    this.email,
    this.userId,
    this.userPassword,
    this.userType,
    this.isActive,
    this.activeRegions,
    this.empID,
    this.empName,
    this.organization,
    this.designation,
    this.depName,
    this.intimes,
    this.address,
    this.emailaddress,
    this.deptName,
    this.tableNativeUser,
    this.logStatus,
    this.phone,
    this.otherPermission,
    this.mobile,
    this.regionName,
    this.mainDepartmentName,
    this.managerId,
    this.manager,
    this.regionId,
    this.organizationId,
    this.empGID,
    this.mainDeptId,
    this.departmentId,
    this.photoUrl,
    this.signUrl,
    this.updated_By,
    this.updated_Date,
  });

  EmployeeModel copyWith({
    String? id,
    String? email,
    String? userId,
    String? userPassword,
    String? userType,
    String? isActive,
    String? activeRegions,
    String? empID,
    String? empName,
    String? organization,
    String? designation,
    String? depName,
    String? intimes,
    String? address,
    String? emailaddress,
    String? deptName,
    bool? tableNativeUser,
    bool? logStatus,
    String? phone,
    String? otherPermission,
    String? mobile,
    String? regionName,
    String? mainDepartmentName,
    String? managerId,
    String? manager,
    String? regionId,
    String? organizationId,
    String? empGID,
    String? mainDeptId,
    String? departmentId,
    String? photoUrl,
    String? signUrl,
    String? updated_By,
    String? updated_Date,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      email: email ?? this.email,
      userId: userId ?? this.userId,
      userPassword: userPassword ?? this.userPassword,
      userType: userType ?? this.userType,
      isActive: isActive ?? this.isActive,
      activeRegions: activeRegions ?? this.activeRegions,
      empID: empID ?? this.empID,
      empName: empName ?? this.empName,
      organization: organization ?? this.organization,
      designation: designation ?? this.designation,
      depName: depName ?? this.depName,
      intimes: intimes ?? this.intimes,
      address: address ?? this.address,
      emailaddress: emailaddress ?? this.emailaddress,
      deptName: deptName ?? this.deptName,
      tableNativeUser: tableNativeUser ?? this.tableNativeUser,
      logStatus: logStatus ?? this.logStatus,
      phone: phone ?? this.phone,
      otherPermission: otherPermission ?? this.otherPermission,
      mobile: mobile ?? this.mobile,
      regionName: regionName ?? this.regionName,
      mainDepartmentName: mainDepartmentName ?? this.mainDepartmentName,
      managerId: managerId ?? this.managerId,
      manager: manager ?? this.manager,
      regionId: regionId ?? this.regionId,
      organizationId: organizationId ?? this.organizationId,
      empGID: empGID ?? this.empGID,
      mainDeptId: mainDeptId ?? this.mainDeptId,
      departmentId: departmentId ?? this.departmentId,
      photoUrl: photoUrl ?? this.photoUrl,
      signUrl: signUrl ?? this.signUrl,
      updated_By: updated_By ?? this.updated_By,
      updated_Date: updated_Date ?? this.updated_Date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'userId': userId,
      'userPassword': userPassword,
      'userType': userType,
      'isActive': isActive,
      'activeRegions': activeRegions,
      'empID': empID,
      'empName': empName,
      'organization': organization,
      'designation': designation,
      'depName': depName,
      'intimes': intimes,
      'address': address,
      'emailaddress': emailaddress,
      'deptName': deptName,
      'tableNativeUser': tableNativeUser,
      'logStatus': logStatus,
      'phone': phone,
      'otherPermission': otherPermission,
      'mobile': mobile,
      'regionName': regionName,
      'mainDepartmentName': mainDepartmentName,
      'managerId': managerId,
      'manager': manager,
      'regionId': regionId,
      'organizationId': organizationId,
      'empGID': empGID,
      'mainDeptId': mainDeptId,
      'departmentId': departmentId,
      'photoUrl': photoUrl,
      'signUrl': signUrl,
      'updated_By': updated_By,
      'updated_Date': updated_Date,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      userPassword:
          map['userPassword'] != null ? map['userPassword'] as String : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as String : null,
      activeRegions:
          map['activeRegions'] != null ? map['activeRegions'] as String : null,
      empID: map['empID'] != null ? map['empID'] as String : null,
      empName: map['empName'] != null ? map['empName'] as String : null,
      organization:
          map['organization'] != null ? map['organization'] as String : null,
      designation:
          map['designation'] != null ? map['designation'] as String : null,
      depName: map['depName'] != null ? map['depName'] as String : null,
      intimes: map['intimes'] != null ? map['intimes'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      emailaddress:
          map['emailaddress'] != null ? map['emailaddress'] as String : null,
      deptName: map['deptName'] != null ? map['deptName'] as String : null,
      tableNativeUser: map['tableNativeUser'] != null
          ? map['tableNativeUser'] as bool
          : null,
      logStatus: map['logStatus'] != null ? map['logStatus'] as bool : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      otherPermission: map['otherPermission'] != null
          ? map['otherPermission'] as String
          : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      regionName:
          map['regionName'] != null ? map['regionName'] as String : null,
      mainDepartmentName: map['mainDepartmentName'] != null
          ? map['mainDepartmentName'] as String
          : null,
      managerId: map['managerId'] != null ? map['managerId'] as String : null,
      manager: map['manager'] != null ? map['manager'] as String : null,
      regionId: map['regionId'] != null ? map['regionId'] as String : null,
      organizationId: map['organizationId'] != null
          ? map['organizationId'] as String
          : null,
      empGID: map['empGID'] != null ? map['empGID'] as String : null,
      mainDeptId:
          map['mainDeptId'] != null ? map['mainDeptId'] as String : null,
      departmentId:
          map['departmentId'] != null ? map['departmentId'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      signUrl: map['signUrl'] != null ? map['signUrl'] as String : null,
      updated_By:
          map['updated_By'] != null ? map['updated_By'] as String : null,
      updated_Date:
          map['updated_Date'] != null ? map['updated_Date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeModel(id: $id, email: $email, userId: $userId, userPassword: $userPassword, userType: $userType, isActive: $isActive, activeRegions: $activeRegions, empID: $empID, empName: $empName, organization: $organization, designation: $designation, depName: $depName, intimes: $intimes, address: $address, emailaddress: $emailaddress, deptName: $deptName, tableNativeUser: $tableNativeUser, logStatus: $logStatus, phone: $phone, otherPermission: $otherPermission, mobile: $mobile, regionName: $regionName, mainDepartmentName: $mainDepartmentName, managerId: $managerId, manager: $manager, regionId: $regionId, organizationId: $organizationId, empGID: $empGID, mainDeptId: $mainDeptId, departmentId: $departmentId, photoUrl: $photoUrl, signUrl: $signUrl, updated_By: $updated_By, updated_Date: $updated_Date)';
  }

  @override
  bool operator ==(covariant EmployeeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.userId == userId &&
        other.userPassword == userPassword &&
        other.userType == userType &&
        other.isActive == isActive &&
        other.activeRegions == activeRegions &&
        other.empID == empID &&
        other.empName == empName &&
        other.organization == organization &&
        other.designation == designation &&
        other.depName == depName &&
        other.intimes == intimes &&
        other.address == address &&
        other.emailaddress == emailaddress &&
        other.deptName == deptName &&
        other.tableNativeUser == tableNativeUser &&
        other.logStatus == logStatus &&
        other.phone == phone &&
        other.otherPermission == otherPermission &&
        other.mobile == mobile &&
        other.regionName == regionName &&
        other.mainDepartmentName == mainDepartmentName &&
        other.managerId == managerId &&
        other.manager == manager &&
        other.regionId == regionId &&
        other.organizationId == organizationId &&
        other.empGID == empGID &&
        other.mainDeptId == mainDeptId &&
        other.departmentId == departmentId &&
        other.photoUrl == photoUrl &&
        other.signUrl == signUrl &&
        other.updated_By == updated_By &&
        other.updated_Date == updated_Date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        userId.hashCode ^
        userPassword.hashCode ^
        userType.hashCode ^
        isActive.hashCode ^
        activeRegions.hashCode ^
        empID.hashCode ^
        empName.hashCode ^
        organization.hashCode ^
        designation.hashCode ^
        depName.hashCode ^
        intimes.hashCode ^
        address.hashCode ^
        emailaddress.hashCode ^
        deptName.hashCode ^
        tableNativeUser.hashCode ^
        logStatus.hashCode ^
        phone.hashCode ^
        otherPermission.hashCode ^
        mobile.hashCode ^
        regionName.hashCode ^
        mainDepartmentName.hashCode ^
        managerId.hashCode ^
        manager.hashCode ^
        regionId.hashCode ^
        organizationId.hashCode ^
        empGID.hashCode ^
        mainDeptId.hashCode ^
        departmentId.hashCode ^
        photoUrl.hashCode ^
        signUrl.hashCode ^
        updated_By.hashCode ^
        updated_Date.hashCode;
  }
}
