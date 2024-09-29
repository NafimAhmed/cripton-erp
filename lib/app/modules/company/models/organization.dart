// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrganizationModel {
  String? id;
  String? name;
  String? address;
  String? phone;
  String? fax;
  String? email;
  String? web;
  String? orginationNameBangla;
  String? sortOrder;
  String? addressBangla;
  String? compShortCode;
  String? compShortName;
  String? basicDataCompWise;
  String? headerName;
  String? logoName;
  String? isActive;
  OrganizationModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.fax,
    this.email,
    this.web,
    this.orginationNameBangla,
    this.sortOrder,
    this.addressBangla,
    this.compShortCode,
    this.compShortName,
    this.basicDataCompWise,
    this.headerName,
    this.logoName,
    this.isActive,
  });

  OrganizationModel copyWith({
    String? id,
    String? name,
    String? address,
    String? phone,
    String? fax,
    String? email,
    String? web,
    String? orginationNameBangla,
    String? sortOrder,
    String? addressBangla,
    String? compShortCode,
    String? compShortName,
    String? basicDataCompWise,
    String? headerName,
    String? logoName,
    String? isActive,
  }) {
    return OrganizationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      fax: fax ?? this.fax,
      email: email ?? this.email,
      web: web ?? this.web,
      orginationNameBangla: orginationNameBangla ?? this.orginationNameBangla,
      sortOrder: sortOrder ?? this.sortOrder,
      addressBangla: addressBangla ?? this.addressBangla,
      compShortCode: compShortCode ?? this.compShortCode,
      compShortName: compShortName ?? this.compShortName,
      basicDataCompWise: basicDataCompWise ?? this.basicDataCompWise,
      headerName: headerName ?? this.headerName,
      logoName: logoName ?? this.logoName,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'fax': fax,
      'email': email,
      'web': web,
      'orginationNameBangla': orginationNameBangla,
      'sortOrder': sortOrder,
      'addressBangla': addressBangla,
      'compShortCode': compShortCode,
      'compShortName': compShortName,
      'basicDataCompWise': basicDataCompWise,
      'headerName': headerName,
      'logoName': logoName,
      'isActive': isActive,
    };
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      fax: map['fax'] != null ? map['fax'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      web: map['web'] != null ? map['web'] as String : null,
      orginationNameBangla: map['orginationNameBangla'] != null
          ? map['orginationNameBangla'] as String
          : null,
      sortOrder: map['sortOrder'] != null ? map['sortOrder'] as String : null,
      addressBangla:
          map['addressBangla'] != null ? map['addressBangla'] as String : null,
      compShortCode:
          map['compShortCode'] != null ? map['compShortCode'] as String : null,
      compShortName:
          map['compShortName'] != null ? map['compShortName'] as String : null,
      basicDataCompWise: map['basicDataCompWise'] != null
          ? map['basicDataCompWise'] as String
          : null,
      headerName:
          map['headerName'] != null ? map['headerName'] as String : null,
      logoName: map['logoName'] != null ? map['logoName'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrganizationModel.fromJson(String source) =>
      OrganizationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '$name';
  }

  @override
  bool operator ==(covariant OrganizationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.phone == phone &&
        other.fax == fax &&
        other.email == email &&
        other.web == web &&
        other.orginationNameBangla == orginationNameBangla &&
        other.sortOrder == sortOrder &&
        other.addressBangla == addressBangla &&
        other.compShortCode == compShortCode &&
        other.compShortName == compShortName &&
        other.basicDataCompWise == basicDataCompWise &&
        other.headerName == headerName &&
        other.logoName == logoName &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        fax.hashCode ^
        email.hashCode ^
        web.hashCode ^
        orginationNameBangla.hashCode ^
        sortOrder.hashCode ^
        addressBangla.hashCode ^
        compShortCode.hashCode ^
        compShortName.hashCode ^
        basicDataCompWise.hashCode ^
        headerName.hashCode ^
        logoName.hashCode ^
        isActive.hashCode;
  }
}
