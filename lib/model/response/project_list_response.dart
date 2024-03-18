import 'dart:convert';

class ProjectListResponse {
  bool? isSuccess;
  List<ProjectRecords>? records;

  ProjectListResponse(
      {
        this.isSuccess,
        this.records
      });

  ProjectListResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['records'] != null) {
      records = <ProjectRecords>[];
      json['records'].forEach((v) {
        records!.add(ProjectRecords.fromJson(v));
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

class ProjectRecords {

  int? projectId;
  String? projectNumber;
  String? projectName;
  String? startDate;
  String? endDate;
  int? projectStatusId;
  String? projectStatusName;

  ProjectRecords(
      {
        this.projectId,
        this.projectNumber,
        this.projectName,
        this.startDate,
        this.endDate,
        this.projectStatusId,
        this.projectStatusName
      });

  ProjectRecords.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    projectNumber = json['project_number'];
    projectName = json['project_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    projectStatusId = json['status_id'];
    projectStatusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['project_id'] = projectId;
    data['project_number'] = projectNumber;
    data['project_name'] = projectName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status_id'] = projectStatusId;
    data['status_name'] = projectStatusName;
    return data;
  }
}
