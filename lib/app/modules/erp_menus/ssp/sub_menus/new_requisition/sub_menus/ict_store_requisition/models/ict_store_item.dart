// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ICTStoreItemModel {
  String? productName;
  String? justification;
  String? reqItemId;
  String? reqItemQty;
  String? sortBy;
  ICTStoreItemModel({
    this.productName,
    this.justification,
    this.reqItemId,
    this.reqItemQty,
    this.sortBy,
  });

  ICTStoreItemModel copyWith({
    String? productName,
    String? justification,
    String? reqItemId,
    String? reqItemQty,
    String? sortBy,
  }) {
    return ICTStoreItemModel(
      productName: productName ?? this.productName,
      justification: justification ?? this.justification,
      reqItemId: reqItemId ?? this.reqItemId,
      reqItemQty: reqItemQty ?? this.reqItemQty,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'justification': justification,
      'reqItemId': reqItemId,
      'reqItemQty': reqItemQty,
      'sortBy': sortBy,
    };
  }

  factory ICTStoreItemModel.fromMap(Map<String, dynamic> map) {
    return ICTStoreItemModel(
      productName:
          map['productName'] != null ? map['productName'] as String : null,
      justification:
          map['justification'] != null ? map['justification'] as String : null,
      reqItemId: map['reqItemId'] != null ? map['reqItemId'] as String : null,
      reqItemQty:
          map['reqItemQty'] != null ? map['reqItemQty'] as String : null,
      sortBy: map['sortBy'] != null ? map['sortBy'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ICTStoreItemModel.fromJson(String source) =>
      ICTStoreItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ICTStoreItemModel(productName: $productName, justification: $justification, reqItemId: $reqItemId, reqItemQty: $reqItemQty, sortBy: $sortBy)';
  }

  @override
  bool operator ==(covariant ICTStoreItemModel other) {
    if (identical(this, other)) return true;

    return other.productName == productName &&
        other.justification == justification &&
        other.reqItemId == reqItemId &&
        other.reqItemQty == reqItemQty &&
        other.sortBy == sortBy;
  }

  @override
  int get hashCode {
    return productName.hashCode ^
        justification.hashCode ^
        reqItemId.hashCode ^
        reqItemQty.hashCode ^
        sortBy.hashCode;
  }
}
