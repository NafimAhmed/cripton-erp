// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ICTServiceModel {
  String? id;
  String? productCode;
  String? productName;
  String? groupId;
  String? groupCode;
  String? groupName;
  String? groupSName;
  String? typeId;
  String? typeCode;
  String? typeName;
  String? unitId;
  String? unitName;
  String? aboutProduct;
  String? isActive;
  String? createdBy;
  String? createdTime;
  String? modifiedBy;
  String? modifiedTime;
  ICTServiceModel({
    this.id,
    this.productCode,
    this.productName,
    this.groupId,
    this.groupCode,
    this.groupName,
    this.groupSName,
    this.typeId,
    this.typeCode,
    this.typeName,
    this.unitId,
    this.unitName,
    this.aboutProduct,
    this.isActive,
    this.createdBy,
    this.createdTime,
    this.modifiedBy,
    this.modifiedTime,
  });

  ICTServiceModel copyWith({
    String? id,
    String? productCode,
    String? productName,
    String? groupId,
    String? groupCode,
    String? groupName,
    String? groupSName,
    String? typeId,
    String? typeCode,
    String? typeName,
    String? unitId,
    String? unitName,
    String? aboutProduct,
    String? isActive,
    String? createdBy,
    String? createdTime,
    String? modifiedBy,
    String? modifiedTime,
  }) {
    return ICTServiceModel(
      id: id ?? this.id,
      productCode: productCode ?? this.productCode,
      productName: productName ?? this.productName,
      groupId: groupId ?? this.groupId,
      groupCode: groupCode ?? this.groupCode,
      groupName: groupName ?? this.groupName,
      groupSName: groupSName ?? this.groupSName,
      typeId: typeId ?? this.typeId,
      typeCode: typeCode ?? this.typeCode,
      typeName: typeName ?? this.typeName,
      unitId: unitId ?? this.unitId,
      unitName: unitName ?? this.unitName,
      aboutProduct: aboutProduct ?? this.aboutProduct,
      isActive: isActive ?? this.isActive,
      createdBy: createdBy ?? this.createdBy,
      createdTime: createdTime ?? this.createdTime,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      modifiedTime: modifiedTime ?? this.modifiedTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productCode': productCode,
      'productName': productName,
      'groupId': groupId,
      'groupCode': groupCode,
      'groupName': groupName,
      'groupSName': groupSName,
      'typeId': typeId,
      'typeCode': typeCode,
      'typeName': typeName,
      'unitId': unitId,
      'unitName': unitName,
      'aboutProduct': aboutProduct,
      'isActive': isActive,
      'createdBy': createdBy,
      'createdTime': createdTime,
      'modifiedBy': modifiedBy,
      'modifiedTime': modifiedTime,
    };
  }

  factory ICTServiceModel.fromMap(Map<String, dynamic> map) {
    return ICTServiceModel(
      id: map['id'] != null ? map['id'] as String : null,
      productCode:
          map['productCode'] != null ? map['productCode'] as String : null,
      productName:
          map['productName'] != null ? map['productName'] as String : null,
      groupId: map['groupId'] != null ? map['groupId'] as String : null,
      groupCode: map['groupCode'] != null ? map['groupCode'] as String : null,
      groupName: map['groupName'] != null ? map['groupName'] as String : null,
      groupSName:
          map['groupSName'] != null ? map['groupSName'] as String : null,
      typeId: map['typeId'] != null ? map['typeId'] as String : null,
      typeCode: map['typeCode'] != null ? map['typeCode'] as String : null,
      typeName: map['typeName'] != null ? map['typeName'] as String : null,
      unitId: map['unitId'] != null ? map['unitId'] as String : null,
      unitName: map['unitName'] != null ? map['unitName'] as String : null,
      aboutProduct:
          map['aboutProduct'] != null ? map['aboutProduct'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as String : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      createdTime:
          map['createdTime'] != null ? map['createdTime'] as String : null,
      modifiedBy:
          map['modifiedBy'] != null ? map['modifiedBy'] as String : null,
      modifiedTime:
          map['modifiedTime'] != null ? map['modifiedTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ICTServiceModel.fromJson(String source) =>
      ICTServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '$productName';
  }

  @override
  bool operator ==(covariant ICTServiceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productCode == productCode &&
        other.productName == productName &&
        other.groupId == groupId &&
        other.groupCode == groupCode &&
        other.groupName == groupName &&
        other.groupSName == groupSName &&
        other.typeId == typeId &&
        other.typeCode == typeCode &&
        other.typeName == typeName &&
        other.unitId == unitId &&
        other.unitName == unitName &&
        other.aboutProduct == aboutProduct &&
        other.isActive == isActive &&
        other.createdBy == createdBy &&
        other.createdTime == createdTime &&
        other.modifiedBy == modifiedBy &&
        other.modifiedTime == modifiedTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productCode.hashCode ^
        productName.hashCode ^
        groupId.hashCode ^
        groupCode.hashCode ^
        groupName.hashCode ^
        groupSName.hashCode ^
        typeId.hashCode ^
        typeCode.hashCode ^
        typeName.hashCode ^
        unitId.hashCode ^
        unitName.hashCode ^
        aboutProduct.hashCode ^
        isActive.hashCode ^
        createdBy.hashCode ^
        createdTime.hashCode ^
        modifiedBy.hashCode ^
        modifiedTime.hashCode;
  }
}
