class MonthlyAttendanceModel {
  String? empid;
  String? empName;
  int? present;
  int? abs;
  int? leavestatus;
  String? divOuttime;
  String? workingHours;
  String? intime;
  String? outtime;
  String? atndate;
  String? company;

  MonthlyAttendanceModel(
      {this.empid,
      this.empName,
      this.present,
      this.abs,
      this.leavestatus,
      this.divOuttime,
      this.workingHours,
      this.intime,
      this.outtime,
      this.atndate,
      this.company});

  MonthlyAttendanceModel.fromJson(Map<String, dynamic> json) {
    empid = json['empid'];
    empName = json['empName'];
    present = json['present'];
    abs = json['abs'];
    leavestatus = json['leavestatus'];
    divOuttime = json['divOuttime'];
    workingHours = json['workingHours'];
    intime = json['intime'];
    outtime = json['outtime'];
    atndate = json['atndate'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empid'] = empid;
    data['empName'] = empName;
    data['present'] = present;
    data['abs'] = abs;
    data['leavestatus'] = leavestatus;
    data['divOuttime'] = divOuttime;
    data['workingHours'] = workingHours;
    data['intime'] = intime;
    data['outtime'] = outtime;
    data['atndate'] = atndate;
    data['company'] = company;
    return data;
  }
}
