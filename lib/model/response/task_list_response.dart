import 'dart:convert';

class TaskListResponse {
  bool? isSuccess;
  List<TaskRecords>? records;

  TaskListResponse(
      {
        this.isSuccess,
        this.records
      });

  TaskListResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['records'] != null) {
      records = <TaskRecords>[];
      json['records'].forEach((v) {
        records!.add(TaskRecords.fromJson(v));
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

class TaskRecords {

  int? taskId;
  String? taskName;
  String? startDate;
  String? endDate;
  String? taskStatusName;
  int? taskStatusId;
  String? taskType;
  int? taskTypeId;

  TaskRecords(
      {
        this.taskId,
        this.taskName,
        this.startDate,
        this.endDate,
        this.taskStatusName,
        this.taskStatusId,
        this.taskType,
        this.taskTypeId
      });

  TaskRecords.fromJson(Map<String, dynamic> json) {
    taskId = json['record_id'];
    taskName = json['task_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    taskStatusId = json['status_id'];
    taskStatusName = json['status_name'];
    taskType = json['task_type'];
    taskTypeId = json['task_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['record_id'] = taskId;
    data['task_name'] = taskName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status_id'] = taskStatusId;
    data['status_name'] = taskStatusName;
    data['task_type'] = taskType;
    data['task_type_id'] = taskTypeId;
    return data;
  }
}
