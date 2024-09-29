// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApprovalSummaryModel {
  String? title;
  String? header;
  String? details;
  String? targetURL;
  int? counts;
  ApprovalSummaryModel({
    this.title,
    this.header,
    this.details,
    this.targetURL,
    this.counts,
  });

  factory ApprovalSummaryModel.fromMap(Map<String, dynamic> map) {
    return ApprovalSummaryModel(
      title: map['title'] != null ? map['title'] as String : null,
      header: map['header'] != null ? map['header'] as String : null,
      details: map['details'] != null ? map['details'] as String : null,
      targetURL: map['targetURL'] != null ? map['targetURL'] as String : null,
      counts: map['counts'] != null ? map['counts'] as int : null,
    );
  }

  factory ApprovalSummaryModel.fromJson(String source) =>
      ApprovalSummaryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApprovalSummaryModel(title: $title, header: $header, details: $details, targetURL: $targetURL, counts: $counts)';
  }
}
