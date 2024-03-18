import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workundo_hrms/model/response/project_list_response.dart';
import 'package:workundo_hrms/utils/colors.dart';
import 'package:workundo_hrms/utils/constants.dart';
import 'package:workundo_hrms/utils/images.dart';

class TaskCard extends StatelessWidget {

  final List<ProjectRecords> projectList;
  final int index;

  const TaskCard({
    super.key,
    required this.projectList,
    required this.index
  });

  @override
  Widget build(BuildContext context){
    ProjectRecords project = projectList[index];
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.67),
            border: Border.all(
              color: Colors.white,
              width: 0.1,
            ),
            color: textFieldBlack
        ),
        width: MediaQuery.of(context).size.width,
        height: 59,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              margin: const EdgeInsets.fromLTRB(15.42, 13.75, 15.42, 13.75),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      project.projectName ?? "---",
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Clash',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        decoration: TextDecoration.none,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${parseToDay(project.startDate ?? "")} - ${parseToDay(project.endDate ?? "")}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Clash',
                          fontWeight: FontWeight.w500,
                          fontSize: 8.33,
                          decoration: TextDecoration.none,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      if(project.projectStatusId != 3 || project.projectStatusId != 3)
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: daysLeftWidget(project.endDate ?? ''),
                        )
                      else
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            project.projectStatusName ?? '----',
                            style: const TextStyle(
                              color: statusCompleteGreen,
                              fontFamily: 'Clash',
                              fontWeight: FontWeight.w500,
                              fontSize: 8.33,
                              decoration: TextDecoration.none,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset(Images.next, width: 24,),
            )
          ],
        ),
      ),
    );
  }
}

Widget daysLeftWidget(String dateString) {
  DateTime lastDate = DateFormat("yyyy-MM-dd").parse(dateString);
  DateTime today = DateTime.now();
  Duration difference = lastDate.difference(today);

  if (difference.inDays == 0) {
    return const Text(
      "Today",
      style: TextStyle(
        color: Colors.red,
        fontFamily: 'Clash',
        fontWeight: FontWeight.w500,
        fontSize: 8.33,
        decoration: TextDecoration.none,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  } else if (difference.inDays > 0) {
    return Text(
      "${difference.inDays} ${difference.inDays == 1 ? 'Day' : 'Days'} Left",
      style: const TextStyle(
        color: Colors.red,
        fontFamily: 'Clash',
        fontWeight: FontWeight.w500,
        fontSize: 8.33,
        decoration: TextDecoration.none,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  } else {
    return const Text(
      "OverDue",
      style: TextStyle(
        color: Colors.red,
        fontFamily: 'Clash',
        fontWeight: FontWeight.w500,
        fontSize: 8.33,
        decoration: TextDecoration.none,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}