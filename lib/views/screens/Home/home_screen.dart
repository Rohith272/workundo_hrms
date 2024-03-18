import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workundo_hrms/controller/project/project_controller.dart';
import 'package:workundo_hrms/controller/router/router_controller.dart';
import 'package:workundo_hrms/utils/colors.dart';
import 'package:workundo_hrms/utils/enum.dart';
import 'package:workundo_hrms/utils/images.dart';
import 'package:workundo_hrms/views/screens/Attendence/attendence_screen.dart';
import 'package:workundo_hrms/views/screens/Calender/calender_screen.dart';
import 'package:workundo_hrms/views/screens/Task/task_screen.dart';
import 'package:workundo_hrms/views/screens/project/project_screen.dart';
import 'package:workundo_hrms/views/widgets/bottom_bar.dart';
import 'package:workundo_hrms/views/widgets/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final RouterController routerController = Get.put(RouterController());
  final ProjectController projectController = Get.put(ProjectController());

  String? name;
  final TextEditingController searchKeyController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await getCount();
    });
    setState(() {
      routerController.stack.add(const ProjectScreen());
      routerController.indexStack.add(Screens.projectScreen);
    });
    super.initState();
  }

  getCount() async {
    await projectController.getPendingCount();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: routerController.stack.length < 1,
        onPopInvoked: (bool didPop){
          routerController.onWillPop();
          setState(() {});
          if (didPop){
            return;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            toolbarHeight: 180,
            title: Container(
              height: 180,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(21, 19.5, 21, 22.17),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white, // Set your desired border color here
                          width: 0.16, // Set the width of the border
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "worksync",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Syncopate',
                              fontWeight: FontWeight.w700,
                              fontSize: 17
                          ),
                        ),
                        Container(
                          height: 22.38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.39),
                              border: Border.all(
                                color: Colors.white,
                                width: 0.1,
                              ),
                              color: textFieldBlack
                          ),
                          child: Row(
                            children: [
                              Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.39),
                                    child: Image.asset(Images.profileImage, height: 22.38, width: 22.38,),
                                  )
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 7.77, right: 7.77),
                                child: Text(
                                  "My Profile",
                                  style: TextStyle(
                                      fontFamily: 'Clash',
                                      fontSize: 8.21,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.87,
                        padding: EdgeInsets.fromLTRB(7.42, 5.83, 0, 5.83),
                        margin: EdgeInsets.only(top: 13.75),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.67),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.1,
                          ),
                          color: textFieldBlack,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.68,
                              child: CustomSearchField(
                                hintText: "",
                                textEditingController: searchKeyController,
                              ),
                            ),
                            Container(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.search_rounded, color: Colors.white,),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12.5,right: 21.5, left: 21.5),
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            if(routerController.indexStack.last != Screens.projectScreen){
                              setState(() {
                                routerController.stack.add(ProjectScreen());
                                routerController.indexStack.add(Screens.projectScreen);
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.18,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: routerController.indexStack.last == Screens.projectScreen ? unReadContainerColor : textFieldBlack,
                                      ),
                                      width: 12.5,
                                      height: 12.5,
                                      child: Text(
                                        projectController.projectCount.value.toString(),
                                        style: TextStyle(
                                          fontFamily: 'Clash',
                                          fontWeight: routerController.indexStack.last == Screens.projectScreen ? FontWeight.w600 : FontWeight.w400,
                                          fontSize: 11,
                                          color: routerController.indexStack.last == Screens.projectScreen ? Colors.black : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Projects",
                                    style: TextStyle(
                                        fontFamily: 'Clash',
                                        fontWeight: routerController.indexStack.last == Screens.projectScreen ? FontWeight.w700 : FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.white
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            if(routerController.indexStack.last != Screens.taskScreen){
                              setState(() {
                                routerController.indexStack.add(Screens.taskScreen);
                                routerController.stack.add(TaskScreen());
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.14,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // Align "Projects" to the left
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: routerController.indexStack.last == Screens.taskScreen ? unReadContainerColor : textFieldBlack,
                                      ),
                                      width: 12.5,
                                      height: 12.5,
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                          fontFamily: 'Clash',
                                          fontWeight: routerController.indexStack.last == Screens.taskScreen ? FontWeight.w600 : FontWeight.w400,
                                          fontSize: 11,
                                          color: routerController.indexStack.last == Screens.taskScreen ? Colors.black : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Tasks",
                                    style: TextStyle(
                                        fontFamily: 'Clash',
                                        fontWeight: routerController.indexStack.last == Screens.taskScreen ? FontWeight.w700 : FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.white
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            setState(() {
                              if(routerController.indexStack.last != Screens.attendanceScreen){
                                routerController.indexStack.add(Screens.attendanceScreen);
                                routerController.stack.add(const AttendenceScreen());
                              }
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // Align "Projects" to the left
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Attendance",
                                    style: TextStyle(
                                        fontFamily: 'Clash',
                                        fontWeight: routerController.indexStack.last == Screens.attendanceScreen? FontWeight.w700 : FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.white
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (){
                            setState(() {
                              if(routerController.indexStack.last != Screens.calenderScreen){
                                routerController.indexStack.add(Screens.calenderScreen);
                                routerController.stack.add(const CalenderScreen());
                              }
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // Align "Projects" to the left
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Calender",
                                    style: TextStyle(
                                        fontFamily: 'Clash',
                                        fontWeight: routerController.indexStack.last == Screens.calenderScreen ? FontWeight.w700 : FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.white
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Obx(() => routerController.stack.last),
          bottomNavigationBar: BottomNavBar(),
        )
    );
  }
}