// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegionModel {
  String? id;
  String? name;
  String? codeNo;
  String? shortName;
  String? arrAddress;
  String? companyID;
  String? isActive;
  String? purchasContact;
  String? nameBangla;
  String? arrAddressBangla;
  String? companyAddress;
  RegionModel({
    this.id,
    this.name,
    this.codeNo,
    this.shortName,
    this.arrAddress,
    this.companyID,
    this.isActive,
    this.purchasContact,
    this.nameBangla,
    this.arrAddressBangla,
    this.companyAddress,
  });

  RegionModel copyWith({
    String? id,
    String? name,
    String? codeNo,
    String? shortName,
    String? arrAddress,
    String? companyID,
    String? isActive,
    String? purchasContact,
    String? nameBangla,
    String? arrAddressBangla,
    String? companyAddress,
  }) {
    return RegionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      codeNo: codeNo ?? this.codeNo,
      shortName: shortName ?? this.shortName,
      arrAddress: arrAddress ?? this.arrAddress,
      companyID: companyID ?? this.companyID,
      isActive: isActive ?? this.isActive,
      purchasContact: purchasContact ?? this.purchasContact,
      nameBangla: nameBangla ?? this.nameBangla,
      arrAddressBangla: arrAddressBangla ?? this.arrAddressBangla,
      companyAddress: companyAddress ?? this.companyAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'codeNo': codeNo,
      'shortName': shortName,
      'arrAddress': arrAddress,
      'companyID': companyID,
      'isActive': isActive,
      'purchasContact': purchasContact,
      'nameBangla': nameBangla,
      'arrAddressBangla': arrAddressBangla,
      'companyAddress': companyAddress,
    };
  }

  factory RegionModel.fromMap(Map<String, dynamic> map) {
    return RegionModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      codeNo: map['codeNo'] != null ? map['codeNo'] as String : null,
      shortName: map['shortName'] != null ? map['shortName'] as String : null,
      arrAddress:
          map['arrAddress'] != null ? map['arrAddress'] as String : null,
      companyID: map['companyID'] != null ? map['companyID'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as String : null,
      purchasContact: map['purchasContact'] != null
          ? map['purchasContact'] as String
          : null,
      nameBangla:
          map['nameBangla'] != null ? map['nameBangla'] as String : null,
      arrAddressBangla: map['arrAddressBangla'] != null
          ? map['arrAddressBangla'] as String
          : null,
      companyAddress: map['companyAddress'] != null
          ? map['companyAddress'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegionModel.fromJson(String source) =>
      RegionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '$name';
  }

  @override
  bool operator ==(covariant RegionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.codeNo == codeNo &&
        other.shortName == shortName &&
        other.arrAddress == arrAddress &&
        other.companyID == companyID &&
        other.isActive == isActive &&
        other.purchasContact == purchasContact &&
        other.nameBangla == nameBangla &&
        other.arrAddressBangla == arrAddressBangla &&
        other.companyAddress == companyAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        codeNo.hashCode ^
        shortName.hashCode ^
        arrAddress.hashCode ^
        companyID.hashCode ^
        isActive.hashCode ^
        purchasContact.hashCode ^
        nameBangla.hashCode ^
        arrAddressBangla.hashCode ^
        companyAddress.hashCode;
  }
}
