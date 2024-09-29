// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ICTStoreRequisitionDetailModel {
  List<ItemModel>? itemList;
  List<ApprovalFlow>? approvalFlowList;
  List<CommentModel>? commentList;
  ICTStoreRequisitionDetailModel({
    this.itemList,
    this.approvalFlowList,
    this.commentList,
  });

  ICTStoreRequisitionDetailModel copyWith({
    List<ItemModel>? itemList,
    List<ApprovalFlow>? approvalFlowList,
    List<CommentModel>? commentList,
  }) {
    return ICTStoreRequisitionDetailModel(
      itemList: itemList ?? this.itemList,
      approvalFlowList: approvalFlowList ?? this.approvalFlowList,
      commentList: commentList ?? this.commentList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemList': itemList?.map((x) => x.toMap()).toList(),
      'approvalFlowList': approvalFlowList?.map((x) => x.toMap()).toList(),
      'commentList': commentList?.map((x) => x.toMap()).toList(),
    };
  }

  factory ICTStoreRequisitionDetailModel.fromMap(Map<String, dynamic> map) {
    return ICTStoreRequisitionDetailModel(
      itemList: map['itemDetails'] != null
          ? List<ItemModel>.from(
              (map['itemDetails'] as List<dynamic>).map<ItemModel?>(
                (x) => ItemModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      approvalFlowList: map['approvalFlowList'] != null
          ? List<ApprovalFlow>.from(
              (map['approvalFlowList'] as List<dynamic>).map<ApprovalFlow?>(
                (x) => ApprovalFlow.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      commentList: map['comments'] != null
          ? List<CommentModel>.from(
              (map['comments'] as List<dynamic>).map<CommentModel?>(
                (x) => CommentModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ICTStoreRequisitionDetailModel.fromJson(String source) =>
      ICTStoreRequisitionDetailModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ICTStoreRequisitionDetailModel(itemList: $itemList, approvalFlowList: $approvalFlowList, commentList: $commentList)';

  @override
  bool operator ==(covariant ICTStoreRequisitionDetailModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.itemList, itemList) &&
        listEquals(other.approvalFlowList, approvalFlowList) &&
        listEquals(other.commentList, commentList);
  }

  @override
  int get hashCode =>
      itemList.hashCode ^ approvalFlowList.hashCode ^ commentList.hashCode;
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
      comtUserid: map['comtUserid'] != null ? map['comtUserid'] as String : null,
      comttime: map['comttime'] != null ? map['comttime'] as String : null,
      comments: map['comments'] != null ? map['comments'] as String : null,
      isactive: map['isactive'] != null ? map['isactive'] as String : null,
      comtUserName: map['comtUserName'] != null ? map['comtUserName'] as String : null,
      comtUserDesignation: map['comtUserDesignation'] != null ? map['comtUserDesignation'] as String : null,
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
  
    return 
      other.reqId == reqId &&
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

class ItemModel {
  String? id;
  String? reqID;
  String? reqItemID;
  String? reqNum;
  String? reqItemQty;
  String? justification;
  String? remarks;
  String? appItemID;
  String? appItemQty;
  String? stkQty;
  String? appItemAltBy;
  String? issuedQty;
  String? settledQty;
  String? imageIds;
  String? isApproved;
  String? sortBy;
  String? reqItemName;
  String? reqItemUnit;
  String? appItemName;
  String? appItemUnit;
  String? purcRateTk;
  String? prAppQty;
  ItemModel({
    this.id,
    this.reqID,
    this.reqItemID,
    this.reqNum,
    this.reqItemQty,
    this.justification,
    this.remarks,
    this.appItemID,
    this.appItemQty,
    this.stkQty,
    this.appItemAltBy,
    this.issuedQty,
    this.settledQty,
    this.imageIds,
    this.isApproved,
    this.sortBy,
    this.reqItemName,
    this.reqItemUnit,
    this.appItemName,
    this.appItemUnit,
    this.purcRateTk,
    this.prAppQty,
  });

  ItemModel copyWith({
    String? id,
    String? reqID,
    String? reqItemID,
    String? reqNum,
    String? reqItemQty,
    String? justification,
    String? remarks,
    String? appItemID,
    String? appItemQty,
    String? stkQty,
    String? appItemAltBy,
    String? issuedQty,
    String? settledQty,
    String? imageIds,
    String? isApproved,
    String? sortBy,
    String? reqItemName,
    String? reqItemUnit,
    String? appItemName,
    String? appItemUnit,
    String? purcRateTk,
    String? prAppQty,
  }) {
    return ItemModel(
      id: id ?? this.id,
      reqID: reqID ?? this.reqID,
      reqItemID: reqItemID ?? this.reqItemID,
      reqNum: reqNum ?? this.reqNum,
      reqItemQty: reqItemQty ?? this.reqItemQty,
      justification: justification ?? this.justification,
      remarks: remarks ?? this.remarks,
      appItemID: appItemID ?? this.appItemID,
      appItemQty: appItemQty ?? this.appItemQty,
      stkQty: stkQty ?? this.stkQty,
      appItemAltBy: appItemAltBy ?? this.appItemAltBy,
      issuedQty: issuedQty ?? this.issuedQty,
      settledQty: settledQty ?? this.settledQty,
      imageIds: imageIds ?? this.imageIds,
      isApproved: isApproved ?? this.isApproved,
      sortBy: sortBy ?? this.sortBy,
      reqItemName: reqItemName ?? this.reqItemName,
      reqItemUnit: reqItemUnit ?? this.reqItemUnit,
      appItemName: appItemName ?? this.appItemName,
      appItemUnit: appItemUnit ?? this.appItemUnit,
      purcRateTk: purcRateTk ?? this.purcRateTk,
      prAppQty: prAppQty ?? this.prAppQty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'reqID': reqID,
      'reqItemID': reqItemID,
      'reqNum': reqNum,
      'reqItemQty': reqItemQty,
      'justification': justification,
      'remarks': remarks,
      'appItemID': appItemID,
      'appItemQty': appItemQty,
      'stkQty': stkQty,
      'appItemAltBy': appItemAltBy,
      'issuedQty': issuedQty,
      'settledQty': settledQty,
      'imageIds': imageIds,
      'isApproved': isApproved,
      'sortBy': sortBy,
      'reqItemName': reqItemName,
      'reqItemUnit': reqItemUnit,
      'appItemName': appItemName,
      'appItemUnit': appItemUnit,
      'purcRateTk': purcRateTk,
      'prAppQty': prAppQty,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] != null ? map['id'] as String : null,
      reqID: map['reqID'] != null ? map['reqID'] as String : null,
      reqItemID: map['reqItemID'] != null ? map['reqItemID'] as String : null,
      reqNum: map['reqNum'] != null ? map['reqNum'] as String : null,
      reqItemQty:
          map['reqItemQty'] != null ? map['reqItemQty'] as String : null,
      justification:
          map['justification'] != null ? map['justification'] as String : null,
      remarks: map['remarks'] != null ? map['remarks'] as String : null,
      appItemID: map['appItemID'] != null ? map['appItemID'] as String : null,
      appItemQty:
          map['appItemQty'] != null ? map['appItemQty'] as String : null,
      stkQty: map['stkQty'] != null ? map['stkQty'] as String : null,
      appItemAltBy:
          map['appItemAltBy'] != null ? map['appItemAltBy'] as String : null,
      issuedQty: map['issuedQty'] != null ? map['issuedQty'] as String : null,
      settledQty:
          map['settledQty'] != null ? map['settledQty'] as String : null,
      imageIds: map['imageIds'] != null ? map['imageIds'] as String : null,
      isApproved:
          map['isApproved'] != null ? map['isApproved'] as String : null,
      sortBy: map['sortBy'] != null ? map['sortBy'] as String : null,
      reqItemName:
          map['reqItemName'] != null ? map['reqItemName'] as String : null,
      reqItemUnit:
          map['reqItemUnit'] != null ? map['reqItemUnit'] as String : null,
      appItemName:
          map['appItemName'] != null ? map['appItemName'] as String : null,
      appItemUnit:
          map['appItemUnit'] != null ? map['appItemUnit'] as String : null,
      purcRateTk:
          map['purcRateTk'] != null ? map['purcRateTk'] as String : null,
      prAppQty: map['prAppQty'] != null ? map['prAppQty'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(id: $id, reqID: $reqID, reqItemID: $reqItemID, reqNum: $reqNum, reqItemQty: $reqItemQty, justification: $justification, remarks: $remarks, appItemID: $appItemID, appItemQty: $appItemQty, stkQty: $stkQty, appItemAltBy: $appItemAltBy, issuedQty: $issuedQty, settledQty: $settledQty, imageIds: $imageIds, isApproved: $isApproved, sortBy: $sortBy, reqItemName: $reqItemName, reqItemUnit: $reqItemUnit, appItemName: $appItemName, appItemUnit: $appItemUnit, purcRateTk: $purcRateTk, prAppQty: $prAppQty)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.reqID == reqID &&
        other.reqItemID == reqItemID &&
        other.reqNum == reqNum &&
        other.reqItemQty == reqItemQty &&
        other.justification == justification &&
        other.remarks == remarks &&
        other.appItemID == appItemID &&
        other.appItemQty == appItemQty &&
        other.stkQty == stkQty &&
        other.appItemAltBy == appItemAltBy &&
        other.issuedQty == issuedQty &&
        other.settledQty == settledQty &&
        other.imageIds == imageIds &&
        other.isApproved == isApproved &&
        other.sortBy == sortBy &&
        other.reqItemName == reqItemName &&
        other.reqItemUnit == reqItemUnit &&
        other.appItemName == appItemName &&
        other.appItemUnit == appItemUnit &&
        other.purcRateTk == purcRateTk &&
        other.prAppQty == prAppQty;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        reqID.hashCode ^
        reqItemID.hashCode ^
        reqNum.hashCode ^
        reqItemQty.hashCode ^
        justification.hashCode ^
        remarks.hashCode ^
        appItemID.hashCode ^
        appItemQty.hashCode ^
        stkQty.hashCode ^
        appItemAltBy.hashCode ^
        issuedQty.hashCode ^
        settledQty.hashCode ^
        imageIds.hashCode ^
        isApproved.hashCode ^
        sortBy.hashCode ^
        reqItemName.hashCode ^
        reqItemUnit.hashCode ^
        appItemName.hashCode ^
        appItemUnit.hashCode ^
        purcRateTk.hashCode ^
        prAppQty.hashCode;
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
