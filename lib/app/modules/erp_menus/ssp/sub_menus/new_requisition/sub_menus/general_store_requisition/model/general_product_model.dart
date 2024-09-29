// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GeneralProductModel {
  String? id;
  String? shortName;
  String? productNameAll;
  String? productName;
  String? productTypeID;
  String? registerNo;
  String? registerPpageNo;
  String? productcode;
  String? grpShortName;
  String? decription;
  String? groupID;
  String? unitID;
  String? sortOrder;
  String? createdBy;
  String? createdDate;
  String? updateBy;
  String? updateDate;
  String? groupName;
  String? groupeCode;
  String? unitName;
  String? productTypeName;
  String? typeCode;
  String? yarnCount;
  String? yarnComp;
  String? yarnCompID;
  String? yarnCountID;
  String? fabricTypeId;
  String? colorId;
  String? gsmid;
  String? diaid;
  String? colorName;
  String? uprice;
  String? uomFactor;
  GeneralProductModel({
    this.id,
    this.shortName,
    this.productNameAll,
    this.productName,
    this.productTypeID,
    this.registerNo,
    this.registerPpageNo,
    this.productcode,
    this.grpShortName,
    this.decription,
    this.groupID,
    this.unitID,
    this.sortOrder,
    this.createdBy,
    this.createdDate,
    this.updateBy,
    this.updateDate,
    this.groupName,
    this.groupeCode,
    this.unitName,
    this.productTypeName,
    this.typeCode,
    this.yarnCount,
    this.yarnComp,
    this.yarnCompID,
    this.yarnCountID,
    this.fabricTypeId,
    this.colorId,
    this.gsmid,
    this.diaid,
    this.colorName,
    this.uprice,
    this.uomFactor,
  });

  GeneralProductModel copyWith({
    String? id,
    String? shortName,
    String? productNameAll,
    String? productName,
    String? productTypeID,
    String? registerNo,
    String? registerPpageNo,
    String? productcode,
    String? grpShortName,
    String? decription,
    String? groupID,
    String? unitID,
    String? sortOrder,
    String? createdBy,
    String? createdDate,
    String? updateBy,
    String? updateDate,
    String? groupName,
    String? groupeCode,
    String? unitName,
    String? productTypeName,
    String? typeCode,
    String? yarnCount,
    String? yarnComp,
    String? yarnCompID,
    String? yarnCountID,
    String? fabricTypeId,
    String? colorId,
    String? gsmid,
    String? diaid,
    String? colorName,
    String? uprice,
    String? uomFactor,
  }) {
    return GeneralProductModel(
      id: id ?? this.id,
      shortName: shortName ?? this.shortName,
      productNameAll: productNameAll ?? this.productNameAll,
      productName: productName ?? this.productName,
      productTypeID: productTypeID ?? this.productTypeID,
      registerNo: registerNo ?? this.registerNo,
      registerPpageNo: registerPpageNo ?? this.registerPpageNo,
      productcode: productcode ?? this.productcode,
      grpShortName: grpShortName ?? this.grpShortName,
      decription: decription ?? this.decription,
      groupID: groupID ?? this.groupID,
      unitID: unitID ?? this.unitID,
      sortOrder: sortOrder ?? this.sortOrder,
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      updateBy: updateBy ?? this.updateBy,
      updateDate: updateDate ?? this.updateDate,
      groupName: groupName ?? this.groupName,
      groupeCode: groupeCode ?? this.groupeCode,
      unitName: unitName ?? this.unitName,
      productTypeName: productTypeName ?? this.productTypeName,
      typeCode: typeCode ?? this.typeCode,
      yarnCount: yarnCount ?? this.yarnCount,
      yarnComp: yarnComp ?? this.yarnComp,
      yarnCompID: yarnCompID ?? this.yarnCompID,
      yarnCountID: yarnCountID ?? this.yarnCountID,
      fabricTypeId: fabricTypeId ?? this.fabricTypeId,
      colorId: colorId ?? this.colorId,
      gsmid: gsmid ?? this.gsmid,
      diaid: diaid ?? this.diaid,
      colorName: colorName ?? this.colorName,
      uprice: uprice ?? this.uprice,
      uomFactor: uomFactor ?? this.uomFactor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'shortName': shortName,
      'productNameAll': productNameAll,
      'productName': productName,
      'productTypeID': productTypeID,
      'registerNo': registerNo,
      'registerPpageNo': registerPpageNo,
      'productcode': productcode,
      'grpShortName': grpShortName,
      'decription': decription,
      'groupID': groupID,
      'unitID': unitID,
      'sortOrder': sortOrder,
      'createdBy': createdBy,
      'createdDate': createdDate,
      'updateBy': updateBy,
      'updateDate': updateDate,
      'groupName': groupName,
      'groupeCode': groupeCode,
      'unitName': unitName,
      'productTypeName': productTypeName,
      'typeCode': typeCode,
      'yarnCount': yarnCount,
      'yarnComp': yarnComp,
      'yarnCompID': yarnCompID,
      'yarnCountID': yarnCountID,
      'fabricTypeId': fabricTypeId,
      'colorId': colorId,
      'gsmid': gsmid,
      'diaid': diaid,
      'colorName': colorName,
      'uprice': uprice,
      'uomFactor': uomFactor,
    };
  }

  factory GeneralProductModel.fromMap(Map<String, dynamic> map) {
    return GeneralProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      shortName: map['shortName'] != null ? map['shortName'] as String : null,
      productNameAll: map['productNameAll'] != null
          ? map['productNameAll'] as String
          : null,
      productName:
          map['productName'] != null ? map['productName'] as String : null,
      productTypeID:
          map['productTypeID'] != null ? map['productTypeID'] as String : null,
      registerNo:
          map['registerNo'] != null ? map['registerNo'] as String : null,
      registerPpageNo: map['registerPpageNo'] != null
          ? map['registerPpageNo'] as String
          : null,
      productcode:
          map['productcode'] != null ? map['productcode'] as String : null,
      grpShortName:
          map['grpShortName'] != null ? map['grpShortName'] as String : null,
      decription:
          map['decription'] != null ? map['decription'] as String : null,
      groupID: map['groupID'] != null ? map['groupID'] as String : null,
      unitID: map['unitID'] != null ? map['unitID'] as String : null,
      sortOrder: map['sortOrder'] != null ? map['sortOrder'] as String : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      createdDate:
          map['createdDate'] != null ? map['createdDate'] as String : null,
      updateBy: map['updateBy'] != null ? map['updateBy'] as String : null,
      updateDate:
          map['updateDate'] != null ? map['updateDate'] as String : null,
      groupName: map['groupName'] != null ? map['groupName'] as String : null,
      groupeCode:
          map['groupeCode'] != null ? map['groupeCode'] as String : null,
      unitName: map['unitName'] != null ? map['unitName'] as String : null,
      productTypeName: map['productTypeName'] != null
          ? map['productTypeName'] as String
          : null,
      typeCode: map['typeCode'] != null ? map['typeCode'] as String : null,
      yarnCount: map['yarnCount'] != null ? map['yarnCount'] as String : null,
      yarnComp: map['yarnComp'] != null ? map['yarnComp'] as String : null,
      yarnCompID:
          map['yarnCompID'] != null ? map['yarnCompID'] as String : null,
      yarnCountID:
          map['yarnCountID'] != null ? map['yarnCountID'] as String : null,
      fabricTypeId:
          map['fabricTypeId'] != null ? map['fabricTypeId'] as String : null,
      colorId: map['colorId'] != null ? map['colorId'] as String : null,
      gsmid: map['gsmid'] != null ? map['gsmid'] as String : null,
      diaid: map['diaid'] != null ? map['diaid'] as String : null,
      colorName: map['colorName'] != null ? map['colorName'] as String : null,
      uprice: map['uprice'] != null ? map['uprice'] as String : null,
      uomFactor: map['uomFactor'] != null ? map['uomFactor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralProductModel.fromJson(String source) =>
      GeneralProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '$productName - $unitName';
  }

  @override
  bool operator ==(covariant GeneralProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.shortName == shortName &&
        other.productNameAll == productNameAll &&
        other.productName == productName &&
        other.productTypeID == productTypeID &&
        other.registerNo == registerNo &&
        other.registerPpageNo == registerPpageNo &&
        other.productcode == productcode &&
        other.grpShortName == grpShortName &&
        other.decription == decription &&
        other.groupID == groupID &&
        other.unitID == unitID &&
        other.sortOrder == sortOrder &&
        other.createdBy == createdBy &&
        other.createdDate == createdDate &&
        other.updateBy == updateBy &&
        other.updateDate == updateDate &&
        other.groupName == groupName &&
        other.groupeCode == groupeCode &&
        other.unitName == unitName &&
        other.productTypeName == productTypeName &&
        other.typeCode == typeCode &&
        other.yarnCount == yarnCount &&
        other.yarnComp == yarnComp &&
        other.yarnCompID == yarnCompID &&
        other.yarnCountID == yarnCountID &&
        other.fabricTypeId == fabricTypeId &&
        other.colorId == colorId &&
        other.gsmid == gsmid &&
        other.diaid == diaid &&
        other.colorName == colorName &&
        other.uprice == uprice &&
        other.uomFactor == uomFactor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shortName.hashCode ^
        productNameAll.hashCode ^
        productName.hashCode ^
        productTypeID.hashCode ^
        registerNo.hashCode ^
        registerPpageNo.hashCode ^
        productcode.hashCode ^
        grpShortName.hashCode ^
        decription.hashCode ^
        groupID.hashCode ^
        unitID.hashCode ^
        sortOrder.hashCode ^
        createdBy.hashCode ^
        createdDate.hashCode ^
        updateBy.hashCode ^
        updateDate.hashCode ^
        groupName.hashCode ^
        groupeCode.hashCode ^
        unitName.hashCode ^
        productTypeName.hashCode ^
        typeCode.hashCode ^
        yarnCount.hashCode ^
        yarnComp.hashCode ^
        yarnCompID.hashCode ^
        yarnCountID.hashCode ^
        fabricTypeId.hashCode ^
        colorId.hashCode ^
        gsmid.hashCode ^
        diaid.hashCode ^
        colorName.hashCode ^
        uprice.hashCode ^
        uomFactor.hashCode;
  }
}
