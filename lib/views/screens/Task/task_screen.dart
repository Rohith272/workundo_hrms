import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:workundo_hrms/controller/project/project_controller.dart';
import 'package:workundo_hrms/controller/task/task_controller.dart';
import 'package:workundo_hrms/model/response/task_list_response.dart';
import 'package:workundo_hrms/views/screens/Task/task_card.dart';
import 'package:workundo_hrms/views/widgets/custom_loading_indicator.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {


  final _scrollController = ScrollController();
  final TaskController taskController = Get.put(TaskController());
  final ProjectController projectController = Get.put(ProjectController());


  List<TaskRecords> taskList = <TaskRecords>[];
  var isNormalLoading = true.obs;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    getAndPrefillData();
  }

  void _scrollListener() {
    if (_scrollController.offset == _scrollController.position.maxScrollExtent){
      // _loadMoreVertical();
    }
  }

  Future<void> getAndPrefillData() async {
    await taskController.getTaskList();
    await projectController.getPendingCount();
    List<TaskRecords> tList = [];
    for (int i = 0; i < taskController.records.length; i++) {
      tList.add(taskController.records[i]);
    }
    taskList.addAll(tList);
    isNormalLoading.value = false;
    setState(() {
      taskController.pageIndex.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              // if(subTopicList.isNotEmpty)
              Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              reverse: false,
                              padding: const EdgeInsets.only(top: 12.92),
                              shrinkWrap: true,
                              itemCount: taskList.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 12.92,
                                );
                              },
                              itemBuilder: (context, index) {
                                return TaskCard(taskList: taskList, index: index,);
                              },
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: isNormalLoading.value ? const CustomLoadingIndicator() : Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}