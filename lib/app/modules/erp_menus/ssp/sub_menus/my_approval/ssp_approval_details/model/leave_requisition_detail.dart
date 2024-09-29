// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class LeaveRequisitionDetailModel {
  String? id;
  String? reqID;
  String? reqLeaveType;
  String? reqNum;
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
  List<ApprovalFlow>? approvalFlowList;
  List<CommentModel>? comments;
  LeaveRequisitionDetailModel({
    this.id,
    this.reqID,
    this.reqLeaveType,
    this.reqNum,
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
    this.approvalFlowList,
    this.comments,
  });

  LeaveRequisitionDetailModel copyWith({
    String? id,
    String? reqID,
    String? reqLeaveType,
    String? reqNum,
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
    List<ApprovalFlow>? approvalFlowList,
    List<CommentModel>? comments,
  }) {
    return LeaveRequisitionDetailModel(
      id: id ?? this.id,
      reqID: reqID ?? this.reqID,
      reqLeaveType: reqLeaveType ?? this.reqLeaveType,
      reqNum: reqNum ?? this.reqNum,
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
      approvalFlowList: approvalFlowList ?? this.approvalFlowList,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'reqID': reqID,
      'reqLeaveType': reqLeaveType,
      'reqNum': reqNum,
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
      'approvalFlowList': approvalFlowList?.map((x) => x.toMap()).toList(),
      'comments': comments?.map((x) => x.toMap()).toList(),
    };
  }

  factory LeaveRequisitionDetailModel.fromMap(Map<String, dynamic> map) {
    return LeaveRequisitionDetailModel(
      id: map['id'] != null ? map['id'] as String : null,
      reqID: map['reqID'] != null ? map['reqID'] as String : null,
      reqLeaveType:
          map['reqLeaveType'] != null ? map['reqLeaveType'] as String : null,
      reqNum: map['reqNum'] != null ? map['reqNum'] as String : null,
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
      approvalFlowList: map['approvalFlowList'] != null
          ? List<ApprovalFlow>.from(
              (map['approvalFlowList'] as List<dynamic>).map<ApprovalFlow?>(
                (x) => ApprovalFlow.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      comments: map['comments'] != null
          ? List<CommentModel>.from(
              (map['comments'] as List<dynamic>).map<CommentModel?>(
                (x) => CommentModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaveRequisitionDetailModel.fromJson(String source) =>
      LeaveRequisitionDetailModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LeaveRequisitionDetailModel(id: $id, reqID: $reqID, reqLeaveType: $reqLeaveType, reqNum: $reqNum, reqLeaveFrom: $reqLeaveFrom, reqLeaveTo: $reqLeaveTo, reqLeaveDays: $reqLeaveDays, reqLeaveHours: $reqLeaveHours, leavePurpose: $leavePurpose, leaveAddress: $leaveAddress, leaveContact: $leaveContact, leaveDocPath: $leaveDocPath, responsibleEmp: $responsibleEmp, responsibleName: $responsibleName, lvTypeName: $lvTypeName, approvalFlowList: $approvalFlowList, comments: $comments)';
  }

  @override
  bool operator ==(covariant LeaveRequisitionDetailModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.reqID == reqID &&
        other.reqLeaveType == reqLeaveType &&
        other.reqNum == reqNum &&
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
        other.lvTypeName == lvTypeName &&
        listEquals(other.approvalFlowList, approvalFlowList) &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        reqID.hashCode ^
        reqLeaveType.hashCode ^
        reqNum.hashCode ^
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
        lvTypeName.hashCode ^
        approvalFlowList.hashCode ^
        comments.hashCode;
  }
}

class CommentModel {
  String? reqId;
  String? comtType;
  String? comtUserid;
  String? comttime;
  String? comments;
  String? isactive;
  String? comtUserName;
  String? comtUserDesignation;
  CommentModel({
    this.reqId,
    this.comtType,
    this.comtUserid,
    this.comttime,
    this.comments,
    this.isactive,
    this.comtUserName,
    this.comtUserDesignation,
  });

  CommentModel copyWith({
    String? reqId,
    String? comtType,
    String? comtUserid,
    String? comttime,
    String? comments,
    String? isactive,
    String? comtUserName,
    String? comtUserDesignation,
  }) {
    return CommentModel(
      reqId: reqId ?? this.reqId,
      comtType: comtType ?? this.comtType,
      comtUserid: comtUserid ?? this.comtUserid,
      comttime: comttime ?? this.comttime,
      comments: comments ?? this.comments,
      isactive: isactive ?? this.isactive,
      comtUserName: comtUserName ?? this.comtUserName,
      comtUserDesignation: comtUserDesignation ?? this.comtUserDesignation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reqId': reqId,
      'comtType': comtType,
      'comtUserid': comtUserid,
      'comttime': comttime,
      'comments': comments,
      'isactive': isactive,
      'comtUserName': comtUserName,
      'comtUserDesignation': comtUserDesignation,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      reqId: map['reqId'] != null ? map['reqId'] as String : null,
      comtType: map['comtType'] != null ? map['comtType'] as String : null,
      comtUserid:
          map['comtUserid'] != null ? map['comtUserid'] as String : null,
      comttime: map['comttime'] != null ? map['comttime'] as String : null,
      comments: map['comments'] != null ? map['comments'] as String : null,
      isactive: map['isactive'] != null ? map['isactive'] as String : null,
      comtUserName:
          map['comtUserName'] != null ? map['comtUserName'] as String : null,
      comtUserDesignation: map['comtUserDesignation'] != null
          ? map['comtUserDesignation'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(reqId: $reqId, comtType: $comtType, comtUserid: $comtUserid, comttime: $comttime, comments: $comments, isactive: $isactive, comtUserName: $comtUserName, comtUserDesignation: $comtUserDesignation)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.reqId == reqId &&
        other.comtType == comtType &&
        other.comtUserid == comtUserid &&
        other.comttime == comttime &&
        other.comments == comments &&
        other.isactive == isactive &&
        other.comtUserName == comtUserName &&
        other.comtUserDesignation == comtUserDesignation;
  }

  @override
  int get hashCode {
    return reqId.hashCode ^
        comtType.hashCode ^
        comtUserid.hashCode ^
        comttime.hashCode ^
        comments.hashCode ^
        isactive.hashCode ^
        comtUserName.hashCode ^
        comtUserDesignation.hashCode;
  }
}

class ApprovalFlow {
  String? id;
  String? reqId;
  String? reqDate;
  String? reqNum;
  String? wfLId;
  String? levelPriority;
  String? levelUserid;
  String? userCent;
  String? status;
  String? achievedCent;
  String? proxyUserid;
  String? statusTime;
  String? actionNote;
  String? reviewStatusid;
  String? forwardNote;
  String? docName;
  String? approverName;
  String? approverDesi;
  String? approverDept;
  String? approverEmail;
  String? proxyUserName;
  String? proxyUserDesi;
  String? proxyUserDept;
  String? proxyUserEmail;
  String? approverLevel;
  String? levelPassingCent;
  ApprovalFlow({
    this.id,
    this.reqId,
    this.reqDate,
    this.reqNum,
    this.wfLId,
    this.levelPriority,
    this.levelUserid,
    this.userCent,
    this.status,
    this.achievedCent,
    this.proxyUserid,
    this.statusTime,
    this.actionNote,
    this.reviewStatusid,
    this.forwardNote,
    this.docName,
    this.approverName,
    this.approverDesi,
    this.approverDept,
    this.approverEmail,
    this.proxyUserName,
    this.proxyUserDesi,
    this.proxyUserDept,
    this.proxyUserEmail,
    this.approverLevel,
    this.levelPassingCent,
  });

  ApprovalFlow copyWith({
    String? id,
    String? reqId,
    String? reqDate,
    String? reqNum,
    String? wfLId,
    String? levelPriority,
    String? levelUserid,
    String? userCent,
    String? status,
    String? achievedCent,
    String? proxyUserid,
    String? statusTime,
    String? actionNote,
    String? reviewStatusid,
    String? forwardNote,
    String? docName,
    String? approverName,
    String? approverDesi,
    String? approverDept,
    String? approverEmail,
    String? proxyUserName,
    String? proxyUserDesi,
    String? proxyUserDept,
    String? proxyUserEmail,
    String? approverLevel,
    String? levelPassingCent,
  }) {
    return ApprovalFlow(
      id: id ?? this.id,
      reqId: reqId ?? this.reqId,
      reqDate: reqDate ?? this.reqDate,
      reqNum: reqNum ?? this.reqNum,
      wfLId: wfLId ?? this.wfLId,
      levelPriority: levelPriority ?? this.levelPriority,
      levelUserid: levelUserid ?? this.levelUserid,
      userCent: userCent ?? this.userCent,
      status: status ?? this.status,
      achievedCent: achievedCent ?? this.achievedCent,
      proxyUserid: proxyUserid ?? this.proxyUserid,
      statusTime: statusTime ?? this.statusTime,
      actionNote: actionNote ?? this.actionNote,
      reviewStatusid: reviewStatusid ?? this.reviewStatusid,
      forwardNote: forwardNote ?? this.forwardNote,
      docName: docName ?? this.docName,
      approverName: approverName ?? this.approverName,
      approverDesi: approverDesi ?? this.approverDesi,
      approverDept: approverDept ?? this.approverDept,
      approverEmail: approverEmail ?? this.approverEmail,
      proxyUserName: proxyUserName ?? this.proxyUserName,
      proxyUserDesi: proxyUserDesi ?? this.proxyUserDesi,
      proxyUserDept: proxyUserDept ?? this.proxyUserDept,
      proxyUserEmail: proxyUserEmail ?? this.proxyUserEmail,
      approverLevel: approverLevel ?? this.approverLevel,
      levelPassingCent: levelPassingCent ?? this.levelPassingCent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'reqId': reqId,
      'reqDate': reqDate,
      'reqNum': reqNum,
      'wfLId': wfLId,
      'levelPriority': levelPriority,
      'levelUserid': levelUserid,
      'userCent': userCent,
      'status': status,
      'achievedCent': achievedCent,
      'proxyUserid': proxyUserid,
      'statusTime': statusTime,
      'actionNote': actionNote,
      'reviewStatusid': reviewStatusid,
      'forwardNote': forwardNote,
      'docName': docName,
      'approverName': approverName,
      'approverDesi': approverDesi,
      'approverDept': approverDept,
      'approverEmail': approverEmail,
      'proxyUserName': proxyUserName,
      'proxyUserDesi': proxyUserDesi,
      'proxyUserDept': proxyUserDept,
      'proxyUserEmail': proxyUserEmail,
      'approverLevel': approverLevel,
      'levelPassingCent': levelPassingCent,
    };
  }

  factory ApprovalFlow.fromMap(Map<String, dynamic> map) {
    return ApprovalFlow(
      id: map['id'] != null ? map['id'] as String : null,
      reqId: map['reqId'] != null ? map['reqId'] as String : null,
      reqDate: map['reqDate'] != null ? map['reqDate'] as String : null,
      reqNum: map['reqNum'] != null ? map['reqNum'] as String : null,
      wfLId: map['wfLId'] != null ? map['wfLId'] as String : null,
      levelPriority:
          map['levelPriority'] != null ? map['levelPriority'] as String : null,
      levelUserid:
          map['levelUserid'] != null ? map['levelUserid'] as String : null,
      userCent: map['userCent'] != null ? map['userCent'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      achievedCent:
          map['achievedCent'] != null ? map['achievedCent'] as String : null,
      proxyUserid:
          map['proxyUserid'] != null ? map['proxyUserid'] as String : null,
      statusTime:
          map['statusTime'] != null ? map['statusTime'] as String : null,
      actionNote:
          map['actionNote'] != null ? map['actionNote'] as String : null,
      reviewStatusid: map['reviewStatusid'] != null
          ? map['reviewStatusid'] as String
          : null,
      forwardNote:
          map['forwardNote'] != null ? map['forwardNote'] as String : null,
      docName: map['docName'] != null ? map['docName'] as String : null,
      approverName:
          map['approverName'] != null ? map['approverName'] as String : null,
      approverDesi:
          map['approverDesi'] != null ? map['approverDesi'] as String : null,
      approverDept:
          map['approverDept'] != null ? map['approverDept'] as String : null,
      approverEmail:
          map['approverEmail'] != null ? map['approverEmail'] as String : null,
      proxyUserName:
          map['proxyUserName'] != null ? map['proxyUserName'] as String : null,
      proxyUserDesi:
          map['proxyUserDesi'] != null ? map['proxyUserDesi'] as String : null,
      proxyUserDept:
          map['proxyUserDept'] != null ? map['proxyUserDept'] as String : null,
      proxyUserEmail: map['proxyUserEmail'] != null
          ? map['proxyUserEmail'] as String
          : null,
      approverLevel:
          map['approverLevel'] != null ? map['approverLevel'] as String : null,
      levelPassingCent: map['levelPassingCent'] != null
          ? map['levelPassingCent'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApprovalFlow.fromJson(String source) =>
      ApprovalFlow.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApprovalFlow(id: $id, reqId: $reqId, reqDate: $reqDate, reqNum: $reqNum, wfLId: $wfLId, levelPriority: $levelPriority, levelUserid: $levelUserid, userCent: $userCent, status: $status, achievedCent: $achievedCent, proxyUserid: $proxyUserid, statusTime: $statusTime, actionNote: $actionNote, reviewStatusid: $reviewStatusid, forwardNote: $forwardNote, docName: $docName, approverName: $approverName, approverDesi: $approverDesi, approverDept: $approverDept, approverEmail: $approverEmail, proxyUserName: $proxyUserName, proxyUserDesi: $proxyUserDesi, proxyUserDept: $proxyUserDept, proxyUserEmail: $proxyUserEmail, approverLevel: $approverLevel, levelPassingCent: $levelPassingCent)';
  }

  @override
  bool operator ==(covariant ApprovalFlow other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.reqId == reqId &&
        other.reqDate == reqDate &&
        other.reqNum == reqNum &&
        other.wfLId == wfLId &&
        other.levelPriority == levelPriority &&
        other.levelUserid == levelUserid &&
        other.userCent == userCent &&
        other.status == status &&
        other.achievedCent == achievedCent &&
        other.proxyUserid == proxyUserid &&
        other.statusTime == statusTime &&
        other.actionNote == actionNote &&
        other.reviewStatusid == reviewStatusid &&
        other.forwardNote == forwardNote &&
        other.docName == docName &&
        other.approverName == approverName &&
        other.approverDesi == approverDesi &&
        other.approverDept == approverDept &&
        other.approverEmail == approverEmail &&
        other.proxyUserName == proxyUserName &&
        other.proxyUserDesi == proxyUserDesi &&
        other.proxyUserDept == proxyUserDept &&
        other.proxyUserEmail == proxyUserEmail &&
        other.approverLevel == approverLevel &&
        other.levelPassingCent == levelPassingCent;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        reqId.hashCode ^
        reqDate.hashCode ^
        reqNum.hashCode ^
        wfLId.hashCode ^
        levelPriority.hashCode ^
        levelUserid.hashCode ^
        userCent.hashCode ^
        status.hashCode ^
        achievedCent.hashCode ^
        proxyUserid.hashCode ^
        statusTime.hashCode ^
        actionNote.hashCode ^
        reviewStatusid.hashCode ^
        forwardNote.hashCode ^
        docName.hashCode ^
        approverName.hashCode ^
        approverDesi.hashCode ^
        approverDept.hashCode ^
        approverEmail.hashCode ^
        proxyUserName.hashCode ^
        proxyUserDesi.hashCode ^
        proxyUserDept.hashCode ^
        proxyUserEmail.hashCode ^
        approverLevel.hashCode ^
        levelPassingCent.hashCode;
  }
}
