import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workundo_hrms/model/response/pending_count_response.dart';
import 'package:workundo_hrms/model/response/project_list_response.dart';
import 'package:workundo_hrms/service/api_helper.dart';
import 'package:workundo_hrms/utils/constants.dart';

class ProjectController extends GetxController{

  var records = <ProjectRecords>[].obs;
  var pendingRecords = <CountRecords>[].obs;
  var countAll = 0.obs;
  var pageIndex = 1.obs;
  var isHomeLoading = false.obs;
  ProjectListResponse? projectListResponse;
  PendingCountResponse? pendingCountResponse;
  var projectCount = 0.obs;
  var taskCount = 0.obs;
  var checkInTime = "".obs;
  var checkOutTime = "".obs;

  getProjectList() async {
    try {
      ProjectListResponse? response = await APIHelper().getProjectList();
      if (response != null){
        records.value = response.records ?? [];
        countAll.value = records.length;
        projectListResponse = response;
        return projectListResponse;
      }
    } catch(e){
      debugPrint(e.toString());
    }
  }

  getPendingCount() async {
    try {
      PendingCountResponse? response = await APIHelper().getBasicDetails();
      if (response != null){
        pendingRecords.value = response.records ?? [];
        pendingCountResponse = response;
        projectCount.value = pendingRecords.value[0].pendingProjectCount ?? 0;
        taskCount.value = pendingRecords.value[0].pendingTaskCount ?? 0;
        checkInTime.value = pendingRecords.value[0].checkIn ?? "";
        checkOutTime.value = pendingRecords.value[0].checkOut ?? "";
        isHomeLoading.value = false;
        return pendingCountResponse;
      }
    } catch(e){
      debugPrint(e.toString());
    }
  }

  checkIn() async{
    try {
      var response = await APIHelper().checkIn();
      await getPendingCount();
    } catch(e){
      debugPrint(e.toString());
    }
  }

  checkOut() async{
    try {
      var response = await APIHelper().checkOut();
      await getPendingCount();
    } catch(e){
      debugPrint(e.toString());
    }
  }
}