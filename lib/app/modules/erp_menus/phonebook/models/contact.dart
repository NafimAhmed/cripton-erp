class ContactModel {
  int? sl;
  String? id;
  String? email;
  String? empID;
  String? empName;
  String? organization;
  String? designation;
  String? address;
  String? deptName;
  bool? tableNativeUser;
  bool? logStatus;
  String? mobile;
  String? regionId;
  String? organizationId;
  String? empGID;
  String? mainDeptId;
  String? departmentId;
  String? photoUrl;

  ContactModel(
      {this.sl,
      this.id,
      this.email,
      this.empID,
      this.empName,
      this.organization,
      this.designation,
      this.address,
      this.deptName,
      this.tableNativeUser,
      this.logStatus,
      this.mobile,
      this.regionId,
      this.organizationId,
      this.empGID,
      this.mainDeptId,
      this.departmentId,
      this.photoUrl});

  ContactModel.fromJson(Map<String, dynamic> json) {
    sl = json['sl'];
    id = json['id'];
    email = json['email'];
    empID = json['empID'];
    empName = json['empName'];
    organization = json['organization'];
    designation = json['designation'];
    address = json['address'];
    deptName = json['deptName'];
    tableNativeUser = json['tableNativeUser'];
    logStatus = json['logStatus'];
    mobile = json['mobile'];
    regionId = json['regionId'];
    organizationId = json['organizationId'];
    empGID = json['empGID'];
    mainDeptId = json['mainDeptId'];
    departmentId = json['departmentId'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sl'] = sl;
    data['id'] = id;
    data['email'] = email;
    data['empID'] = empID;
    data['empName'] = empName;
    data['organization'] = organization;
    data['designation'] = designation;
    data['address'] = address;
    data['deptName'] = deptName;
    data['tableNativeUser'] = tableNativeUser;
    data['logStatus'] = logStatus;
    data['mobile'] = mobile;
    data['regionId'] = regionId;
    data['organizationId'] = organizationId;
    data['empGID'] = empGID;
    data['mainDeptId'] = mainDeptId;
    data['departmentId'] = departmentId;
    data['photoUrl'] = photoUrl;
    return data;
  }
}
