// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyApprovalModel {
  String? id;
  String? reqId;
  String? status;
  String? preStatus;
  String? levelPriority;
  String? reqNum;
  String? empId;
  String? reqDate;
  String? reqStatus;
  String? reqReference;
  String? reqComReference;
  String? comSName;
  String? requesterName;
  String? requesterComName;
  String? revision;
  String? requesterDesi;
  String? reqLocName;
  String? reqDepName;
  String? reqDocName;
  String? reqDocPath;
  String? reqDocSName;
  String? reqDocType;
  String? reqDocCatFor;
  String? itemNames;
  String? reqComment;
  String? reqLiveLevel;
  String? reqLevel;
  MyApprovalModel({
    this.id,
    this.reqId,
    this.status,
    this.preStatus,
    this.levelPriority,
    this.reqNum,
    this.empId,
    this.reqDate,
    this.reqStatus,
    this.reqReference,
    this.reqComReference,
    this.comSName,
    this.requesterName,
    this.requesterComName,
    this.revision,
    this.requesterDesi,
    this.reqLocName,
    this.reqDepName,
    this.reqDocName,
    this.reqDocPath,
    this.reqDocSName,
    this.reqDocType,
    this.reqDocCatFor,
    this.itemNames,
    this.reqComment,
    this.reqLiveLevel,
    this.reqLevel,
  });

  MyApprovalModel copyWith({
    String? id,
    String? reqId,
    String? status,
    String? preStatus,
    String? levelPriority,
    String? reqNum,
    String? empId,
    String? reqDate,
    String? reqStatus,
    String? reqReference,
    String? reqComReference,
    String? comSName,
    String? requesterName,
    String? requesterComName,
    String? revision,
    String? requesterDesi,
    String? reqLocName,
    String? reqDepName,
    String? reqDocName,
    String? reqDocPath,
    String? reqDocSName,
    String? reqDocType,
    String? reqDocCatFor,
    String? itemNames,
    String? reqComment,
    String? reqLiveLevel,
    String? reqLevel,
  }) {
    return MyApprovalModel(
      id: id ?? this.id,
      reqId: reqId ?? this.reqId,
      status: status ?? this.status,
      preStatus: preStatus ?? this.preStatus,
      levelPriority: levelPriority ?? this.levelPriority,
      reqNum: reqNum ?? this.reqNum,
      empId: empId ?? this.empId,
      reqDate: reqDate ?? this.reqDate,
      reqStatus: reqStatus ?? this.reqStatus,
      reqReference: reqReference ?? this.reqReference,
      reqComReference: reqComReference ?? this.reqComReference,
      comSName: comSName ?? this.comSName,
      requesterName: requesterName ?? this.requesterName,
      requesterComName: requesterComName ?? this.requesterComName,
      revision: revision ?? this.revision,
      requesterDesi: requesterDesi ?? this.requesterDesi,
      reqLocName: reqLocName ?? this.reqLocName,
      reqDepName: reqDepName ?? this.reqDepName,
      reqDocName: reqDocName ?? this.reqDocName,
      reqDocPath: reqDocPath ?? this.reqDocPath,
      reqDocSName: reqDocSName ?? this.reqDocSName,
      reqDocType: reqDocType ?? this.reqDocType,
      reqDocCatFor: reqDocCatFor ?? this.reqDocCatFor,
      itemNames: itemNames ?? this.itemNames,
      reqComment: reqComment ?? this.reqComment,
      reqLiveLevel: reqLiveLevel ?? this.reqLiveLevel,
      reqLevel: reqLevel ?? this.reqLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'reqId': reqId,
      'status': status,
      'preStatus': preStatus,
      'levelPriority': levelPriority,
      'reqNum': reqNum,
      'empId': empId,
      'reqDate': reqDate,
      'reqStatus': reqStatus,
      'reqReference': reqReference,
      'reqComReference': reqComReference,
      'comSName': comSName,
      'requesterName': requesterName,
      'requesterComName': requesterComName,
      'revision': revision,
      'requesterDesi': requesterDesi,
      'reqLocName': reqLocName,
      'reqDepName': reqDepName,
      'reqDocName': reqDocName,
      'reqDocPath': reqDocPath,
      'reqDocSName': reqDocSName,
      'reqDocType': reqDocType,
      'reqDocCatFor': reqDocCatFor,
      'itemNames': itemNames,
      'reqComment': reqComment,
      'reqLiveLevel': reqLiveLevel,
      'reqLevel': reqLevel,
    };
  }

  factory MyApprovalModel.fromMap(Map<String, dynamic> map) {
    return MyApprovalModel(
      id: map['id'] != null ? map['id'] as String : null,
      reqId: map['reqId'] != null ? map['reqId'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      preStatus: map['preStatus'] != null ? map['preStatus'] as String : null,
      levelPriority:
          map['levelPriority'] != null ? map['levelPriority'] as String : null,
      reqNum: map['reqNum'] != null ? map['reqNum'] as String : null,
      empId: map['empId'] != null ? map['empId'] as String : null,
      reqDate: map['reqDate'] != null ? map['reqDate'] as String : null,
      reqStatus: map['reqStatus'] != null ? map['reqStatus'] as String : null,
      reqReference:
          map['reqReference'] != null ? map['reqReference'] as String : null,
      reqComReference: map['reqComReference'] != null
          ? map['reqComReference'] as String
          : null,
      comSName: map['comSName'] != null ? map['comSName'] as String : null,
      requesterName:
          map['requesterName'] != null ? map['requesterName'] as String : null,
      requesterComName: map['requesterComName'] != null
          ? map['requesterComName'] as String
          : null,
      revision: map['revision'] != null ? map['revision'] as String : null,
      requesterDesi:
          map['requesterDesi'] != null ? map['requesterDesi'] as String : null,
      reqLocName:
          map['reqLocName'] != null ? map['reqLocName'] as String : null,
      reqDepName:
          map['reqDepName'] != null ? map['reqDepName'] as String : null,
      reqDocName:
          map['reqDocName'] != null ? map['reqDocName'] as String : null,
      reqDocPath:
          map['reqDocPath'] != null ? map['reqDocPath'] as String : null,
      reqDocSName:
          map['reqDocSName'] != null ? map['reqDocSName'] as String : null,
      reqDocType:
          map['reqDocType'] != null ? map['reqDocType'] as String : null,
      reqDocCatFor:
          map['reqDocCatFor'] != null ? map['reqDocCatFor'] as String : null,
      itemNames: map['itemNames'] != null ? map['itemNames'] as String : null,
      reqComment:
          map['reqComment'] != null ? map['reqComment'] as String : null,
      reqLiveLevel:
          map['reqLiveLevel'] != null ? map['reqLiveLevel'] as String : null,
      reqLevel: map['reqLevel'] != null ? map['reqLevel'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyApprovalModel.fromJson(String source) =>
      MyApprovalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyApprovalModel(id: $id, reqId: $reqId, status: $status, preStatus: $preStatus, levelPriority: $levelPriority, reqNum: $reqNum, empId: $empId, reqDate: $reqDate, reqStatus: $reqStatus, reqReference: $reqReference, reqComReference: $reqComReference, comSName: $comSName, requesterName: $requesterName, requesterComName: $requesterComName, revision: $revision, requesterDesi: $requesterDesi, reqLocName: $reqLocName, reqDepName: $reqDepName, reqDocName: $reqDocName, reqDocPath: $reqDocPath, reqDocSName: $reqDocSName, reqDocType: $reqDocType, reqDocCatFor: $reqDocCatFor, itemNames: $itemNames, reqComment: $reqComment, reqLiveLevel: $reqLiveLevel, reqLevel: $reqLevel)';
  }

  @override
  bool operator ==(covariant MyApprovalModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.reqId == reqId &&
        other.status == status &&
        other.preStatus == preStatus &&
        other.levelPriority == levelPriority &&
        other.reqNum == reqNum &&
        other.empId == empId &&
        other.reqDate == reqDate &&
        other.reqStatus == reqStatus &&
        other.reqReference == reqReference &&
        other.reqComReference == reqComReference &&
        other.comSName == comSName &&
        other.requesterName == requesterName &&
        other.requesterComName == requesterComName &&
        other.revision == revision &&
        other.requesterDesi == requesterDesi &&
        other.reqLocName == reqLocName &&
        other.reqDepName == reqDepName &&
        other.reqDocName == reqDocName &&
        other.reqDocPath == reqDocPath &&
        other.reqDocSName == reqDocSName &&
        other.reqDocType == reqDocType &&
        other.reqDocCatFor == reqDocCatFor &&
        other.itemNames == itemNames &&
        other.reqComment == reqComment &&
        other.reqLiveLevel == reqLiveLevel &&
        other.reqLevel == reqLevel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        reqId.hashCode ^
        status.hashCode ^
        preStatus.hashCode ^
        levelPriority.hashCode ^
        reqNum.hashCode ^
        empId.hashCode ^
        reqDate.hashCode ^
        reqStatus.hashCode ^
        reqReference.hashCode ^
        reqComReference.hashCode ^
        comSName.hashCode ^
        requesterName.hashCode ^
        requesterComName.hashCode ^
        revision.hashCode ^
        requesterDesi.hashCode ^
        reqLocName.hashCode ^
        reqDepName.hashCode ^
        reqDocName.hashCode ^
        reqDocPath.hashCode ^
        reqDocSName.hashCode ^
        reqDocType.hashCode ^
        reqDocCatFor.hashCode ^
        itemNames.hashCode ^
        reqComment.hashCode ^
        reqLiveLevel.hashCode ^
        reqLevel.hashCode;
  }
}
