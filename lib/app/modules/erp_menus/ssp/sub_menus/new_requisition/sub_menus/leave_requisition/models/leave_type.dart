// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LeaveTypeModel {
  String? id;
  String? lvType;
  String? lvQuantity;
  String? lvName;
  String? isEarnLv;
  String? isActive;
  String? lvPaymentType;
  String? sortOrder;
  String? companyID;
  LeaveTypeModel({
    this.id,
    this.lvType,
    this.lvQuantity,
    this.lvName,
    this.isEarnLv,
    this.isActive,
    this.lvPaymentType,
    this.sortOrder,
    this.companyID,
  });

  LeaveTypeModel copyWith({
    String? id,
    String? lvType,
    String? lvQuantity,
    String? lvName,
    String? isEarnLv,
    String? isActive,
    String? lvPaymentType,
    String? sortOrder,
    String? companyID,
  }) {
    return LeaveTypeModel(
      id: id ?? this.id,
      lvType: lvType ?? this.lvType,
      lvQuantity: lvQuantity ?? this.lvQuantity,
      lvName: lvName ?? this.lvName,
      isEarnLv: isEarnLv ?? this.isEarnLv,
      isActive: isActive ?? this.isActive,
      lvPaymentType: lvPaymentType ?? this.lvPaymentType,
      sortOrder: sortOrder ?? this.sortOrder,
      companyID: companyID ?? this.companyID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lvType': lvType,
      'lvQuantity': lvQuantity,
      'lvName': lvName,
      'isEarnLv': isEarnLv,
      'isActive': isActive,
      'lvPaymentType': lvPaymentType,
      'sortOrder': sortOrder,
      'companyID': companyID,
    };
  }

  factory LeaveTypeModel.fromMap(Map<String, dynamic> map) {
    return LeaveTypeModel(
      id: map['id'] != null ? map['id'] as String : null,
      lvType: map['lvType'] != null ? map['lvType'] as String : null,
      lvQuantity:
          map['lvQuantity'] != null ? map['lvQuantity'] as String : null,
      lvName: map['lvName'] != null ? map['lvName'] as String : null,
      isEarnLv: map['isEarnLv'] != null ? map['isEarnLv'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as String : null,
      lvPaymentType:
          map['lvPaymentType'] != null ? map['lvPaymentType'] as String : null,
      sortOrder: map['sortOrder'] != null ? map['sortOrder'] as String : null,
      companyID: map['companyID'] != null ? map['companyID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaveTypeModel.fromJson(String source) =>
      LeaveTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '$lvName';
  }

  @override
  bool operator ==(covariant LeaveTypeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.lvType == lvType &&
        other.lvQuantity == lvQuantity &&
        other.lvName == lvName &&
        other.isEarnLv == isEarnLv &&
        other.isActive == isActive &&
        other.lvPaymentType == lvPaymentType &&
        other.sortOrder == sortOrder &&
        other.companyID == companyID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lvType.hashCode ^
        lvQuantity.hashCode ^
        lvName.hashCode ^
        isEarnLv.hashCode ^
        isActive.hashCode ^
        lvPaymentType.hashCode ^
        sortOrder.hashCode ^
        companyID.hashCode;
  }
}
