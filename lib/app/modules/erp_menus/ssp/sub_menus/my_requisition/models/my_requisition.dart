class MyRequisitionModel {
  String? id;
  String? reqNum;
  String? docID;
  String? wfID;
  String? reqReference;
  String? requesterID;
  String? reqComID;
  String? reqComReference;
  String? reqDate;
  String? revision;
  String? requesterComName;
  String? reqLocID;
  String? reqDepID;
  String? reqSecID;
  String? reqForID;
  String? reqForComID;
  String? reqForLocID;
  String? reqForDepID;
  String? reqForSecID;
  String? reqStatus;
  String? issueStatus;
  String? modifiedTime;
  String? isActive;
  String? lastApprover;
  String? requesterName;
  String? requesterDesi;
  String? requesterEmail;
  String? requesterCode;
  String? reqforName;
  String? reqforDesi;
  String? reqforEmail;
  String? reqforCode;
  String? reqDocName;
  String? reqDocSName;
  String? reqDocType;
  String? reqDocCatFor;
  String? reqComName;
  String? reqLocName;
  String? reqforLocName;
  String? itemNames;
  String? reqComment;
  String? reqDepName;
  String? reqSecName;
  String? reqforComName;
  String? reqforComSName;
  String? reqforDepName;
  String? reqforSecName;
  ApprovalFlows? approvalFlows;

  MyRequisitionModel(
      {this.id,
      this.reqNum,
      this.docID,
      this.wfID,
      this.reqReference,
      this.requesterID,
      this.reqComID,
      this.reqLocID,
      this.reqDepID,
      this.reqSecID,
      this.reqForID,
      this.reqForComID,
      this.reqForLocID,
      this.reqForDepID,
      this.reqForSecID,
      this.reqStatus,
      this.issueStatus,
      this.modifiedTime,
      this.isActive,
      this.lastApprover,
      this.requesterName,
      this.requesterDesi,
      this.requesterEmail,
      this.requesterCode,
      this.reqforName,
      this.reqforDesi,
      this.reqforEmail,
      this.reqforCode,
      this.reqDocName,
      this.reqDocSName,
      this.reqDocType,
      this.reqDocCatFor,
      this.reqComName,
      this.reqLocName,
      this.reqforLocName,
      this.itemNames,
      this.reqComment,
      this.reqDepName,
      this.reqSecName,
      this.reqforComName,
      this.reqforComSName,
      this.reqforDepName,
      this.reqforSecName,
      this.approvalFlows});

  MyRequisitionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reqNum = json['reqNum'];
    docID = json['docID'];
    wfID = json['wfID'];
    reqReference = json['reqReference'];
    requesterID = json['requesterID'];
    reqComID = json['reqComID'];
    reqLocID = json['reqLocID'];
    reqDepID = json['reqDepID'];
    reqSecID = json['reqSecID'];
    reqComReference = json['reqComReference'];
    reqDate = json['reqDate'];
    revision = json['revision'];
    requesterComName = json['requesterComName'];
    reqForID = json['reqForID'];
    reqForComID = json['reqForComID'];
    reqForLocID = json['reqForLocID'];
    reqForDepID = json['reqForDepID'];
    reqForSecID = json['reqForSecID'];
    reqStatus = json['reqStatus'];
    issueStatus = json['issueStatus'];
    modifiedTime = json['modifiedTime'];
    isActive = json['isActive'];
    lastApprover = json['lastApprover'];
    requesterName = json['requesterName'];
    requesterDesi = json['requesterDesi'];
    requesterEmail = json['requesterEmail'];
    requesterCode = json['requesterCode'];
    reqforName = json['reqforName'];
    reqforDesi = json['reqforDesi'];
    reqforEmail = json['reqforEmail'];
    reqforCode = json['reqforCode'];
    reqDocName = json['reqDocName'];
    reqDocSName = json['reqDocSName'];
    reqDocType = json['reqDocType'];
    reqDocCatFor = json['reqDocCatFor'];
    reqComName = json['reqComName'];
    reqLocName = json['reqLocName'];
    reqforLocName = json['reqforLocName'];
    itemNames = json['itemNames'];
    reqComment = json['reqComment'];
    reqDepName = json['reqDepName'];
    reqSecName = json['reqSecName'];
    reqforComName = json['reqforComName'];
    reqforComSName = json['reqforComSName'];
    reqforDepName = json['reqforDepName'];
    reqforSecName = json['reqforSecName'];
    approvalFlows = json['approvalFlows'] != null
        ? ApprovalFlows.fromJson(json['approvalFlows'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reqNum'] = reqNum;
    data['docID'] = docID;
    data['wfID'] = wfID;
    data['reqReference'] = reqReference;
    data['requesterID'] = requesterID;
    data['reqComID'] = reqComID;
    data['reqLocID'] = reqLocID;
    data['reqDepID'] = reqDepID;
    data['reqSecID'] = reqSecID;
    data['reqForID'] = reqForID;
    data['reqForComID'] = reqForComID;
    data['reqForLocID'] = reqForLocID;
    data['reqForDepID'] = reqForDepID;
    data['reqForSecID'] = reqForSecID;
    data['reqStatus'] = reqStatus;
    data['issueStatus'] = issueStatus;
    data['modifiedTime'] = modifiedTime;
    data['isActive'] = isActive;
    data['lastApprover'] = lastApprover;
    data['requesterName'] = requesterName;
    data['requesterDesi'] = requesterDesi;
    data['requesterEmail'] = requesterEmail;
    data['requesterCode'] = requesterCode;
    data['reqforName'] = reqforName;
    data['reqforDesi'] = reqforDesi;
    data['reqforEmail'] = reqforEmail;
    data['reqforCode'] = reqforCode;
    data['reqDocName'] = reqDocName;
    data['reqDocSName'] = reqDocSName;
    data['reqDocType'] = reqDocType;
    data['reqDocCatFor'] = reqDocCatFor;
    data['reqComName'] = reqComName;
    data['reqLocName'] = reqLocName;
    data['reqforLocName'] = reqforLocName;
    data['itemNames'] = itemNames;
    data['reqComment'] = reqComment;
    data['reqDepName'] = reqDepName;
    data['reqSecName'] = reqSecName;
    data['reqforComName'] = reqforComName;
    data['reqforComSName'] = reqforComSName;
    data['reqforDepName'] = reqforDepName;
    data['reqforSecName'] = reqforSecName;
    if (approvalFlows != null) {
      data['approvalFlows'] = approvalFlows!.toJson();
    }
    return data;
  }
}

class ApprovalFlows {
  String? approvalPendingMessage;
  List<ApprovalFlowList>? approvalFlowList;

  ApprovalFlows({this.approvalPendingMessage, this.approvalFlowList});

  ApprovalFlows.fromJson(Map<String, dynamic> json) {
    approvalPendingMessage = json['approvalPendingMessage'];
    if (json['approvalFlowList'] != null) {
      approvalFlowList = <ApprovalFlowList>[];
      json['approvalFlowList'].forEach((v) {
        approvalFlowList!.add(ApprovalFlowList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['approvalPendingMessage'] = approvalPendingMessage;
    if (approvalFlowList != null) {
      data['approvalFlowList'] =
          approvalFlowList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApprovalFlowList {
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

  ApprovalFlowList(
      {this.id,
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
      this.levelPassingCent});

  ApprovalFlowList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reqId = json['reqId'];
    reqDate = json['reqDate'];
    reqNum = json['reqNum'];
    wfLId = json['wfLId'];
    levelPriority = json['levelPriority'];
    levelUserid = json['levelUserid'];
    userCent = json['userCent'];
    status = json['status'];
    achievedCent = json['achievedCent'];
    proxyUserid = json['proxyUserid'];
    statusTime = json['statusTime'];
    actionNote = json['actionNote'];
    reviewStatusid = json['reviewStatusid'];
    forwardNote = json['forwardNote'];
    docName = json['docName'];
    approverName = json['approverName'];
    approverDesi = json['approverDesi'];
    approverDept = json['approverDept'];
    approverEmail = json['approverEmail'];
    proxyUserName = json['proxyUserName'];
    proxyUserDesi = json['proxyUserDesi'];
    proxyUserDept = json['proxyUserDept'];
    proxyUserEmail = json['proxyUserEmail'];
    approverLevel = json['approverLevel'];
    levelPassingCent = json['levelPassingCent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reqId'] = reqId;
    data['reqDate'] = reqDate;
    data['reqNum'] = reqNum;
    data['wfLId'] = wfLId;
    data['levelPriority'] = levelPriority;
    data['levelUserid'] = levelUserid;
    data['userCent'] = userCent;
    data['status'] = status;
    data['achievedCent'] = achievedCent;
    data['proxyUserid'] = proxyUserid;
    data['statusTime'] = statusTime;
    data['actionNote'] = actionNote;
    data['reviewStatusid'] = reviewStatusid;
    data['forwardNote'] = forwardNote;
    data['docName'] = docName;
    data['approverName'] = approverName;
    data['approverDesi'] = approverDesi;
    data['approverDept'] = approverDept;
    data['approverEmail'] = approverEmail;
    data['proxyUserName'] = proxyUserName;
    data['proxyUserDesi'] = proxyUserDesi;
    data['proxyUserDept'] = proxyUserDept;
    data['proxyUserEmail'] = proxyUserEmail;
    data['approverLevel'] = approverLevel;
    data['levelPassingCent'] = levelPassingCent;
    return data;
  }
}
