import 'dart:convert';

class PendingCountResponse {
  bool? isSuccess;
  List<CountRecords>? records;

  PendingCountResponse(
      {
        this.isSuccess,
        this.records
      });

  PendingCountResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['records'] != null) {
      records = <CountRecords>[];
      json['records'].forEach((v) {
        records!.add(CountRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountRecords {

  int? pendingProjectCount;

  CountRecords(
      {
        this.pendingProjectCount
      });

  CountRecords.fromJson(Map<String, dynamic> json) {
    pendingProjectCount = json['pending_project_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pending_project_count'] = pendingProjectCount;
    return data;
  }
}
