import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workundo_hrms/controller/project/project_controller.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  final ProjectController projectController = Get.put(ProjectController());
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 72,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(19),
            topRight: Radius.circular(19),
          ),
          border: Border.all(
            color: Colors.white,
            width: 0.1,
          ),
          color: textFieldBlack
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 14, right: 14),
          height: 54,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.91),
              border: Border.all(
                color: Colors.white,
                width: 0.1,
              ),
              color: textFieldBlack
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(14.25, 10.12, 0, 10.64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Check In",
                      style: TextStyle(
                          fontFamily: 'Clash',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          decoration: TextDecoration.none
                      ),),
                    projectController.checkInTime.isEmpty ? GestureDetector(
                      onTap: () async{
                        await projectController.checkIn();
                        setState(() {});
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(7.68, 3.09, 7.68, 3.09),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.white,
                              width: 0.1,
                            ),
                            color: textFieldBlack
                        ),
                        child: Text(
                          "Click here to check In",
                          style: TextStyle(
                              fontSize: 7.83,
                              fontFamily: 'Clash',
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none
                          ),
                        ),
                      ),
                    ) : Text(
                      projectController.checkInTime.value,
                      style: TextStyle(
                          fontSize: 7.83,
                          fontFamily: 'Clash',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10.12, 14.25, 10.64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Check Out",
                      style: TextStyle(
                          fontFamily: 'Clash',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          decoration: TextDecoration.none
                      ),
                    ),
                    if(projectController.checkInTime.value.isEmpty)
                      Container(
                        padding: EdgeInsets.fromLTRB(7.68, 3.09, 0, 3.09),
                        alignment: Alignment.centerRight,
                        child: Image.asset(Images.dash,height: 8,),
                      )
                    else if (projectController.checkInTime.isNotEmpty && projectController.checkOutTime.isEmpty)
                      GestureDetector(
                        onTap: () async{
                          await projectController.checkOut();
                          setState(() {});
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(7.68, 3.09, 7.68, 3.09),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white,
                                width: 0.1,
                              ),
                              color: textFieldBlack
                          ),
                          child: const Text(
                            "Click here to check Out",
                            style: TextStyle(
                                fontSize: 7.83,
                                fontFamily: 'Clash',
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none
                            ),
                          ),
                        ),
                      )
                    else
                      Text(
                        projectController.checkOutTime.value,
                        style: TextStyle(
                            fontSize: 7.83,
                            fontFamily: 'Clash',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
