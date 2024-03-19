import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workundo_hrms/model/response/pending_count_response.dart';
import 'package:workundo_hrms/model/response/project_list_response.dart';
import 'package:workundo_hrms/model/response/task_list_response.dart';
import 'package:workundo_hrms/service/api_helper.dart';

class TaskController extends GetxController{

  var records = <TaskRecords>[].obs;
  var pendingRecords = <CountRecords>[].obs;
  var countAll = 0.obs;
  var pageIndex = 1.obs;
  var isHomeLoading = false.obs;
  TaskListResponse? taskListResponse;
  PendingCountResponse? pendingCountResponse;
  var projectCount = 0.obs;

  getTaskList() async {
    try {
      TaskListResponse? response = await APIHelper().getTaskList();
      if (response != null){
        records.value = response.records ?? [];
        countAll.value = records.length;
        taskListResponse = response;
        return taskListResponse;
      }
    } catch(e){
      debugPrint(e.toString());
    }
  }

}