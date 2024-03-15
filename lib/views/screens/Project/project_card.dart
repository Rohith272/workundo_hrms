import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workundo_hrms/utils/colors.dart';
import 'package:workundo_hrms/utils/images.dart';

class ProjectCard extends StatelessWidget {

  const ProjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context){
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
                    child:const Text(
                        "Make a UX Design",
                      style: TextStyle(
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
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: const Text(
                            "10 Feb - 12 Feb",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Clash',
                              fontWeight: FontWeight.w500,
                              fontSize: 8.33,
                              decoration: TextDecoration.none,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: const Text(
                            "2 Days Left",
                            style: TextStyle(
                              color: Colors.red,
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
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Image.asset(Images.next, width: 24,),
            )
          ],
        ),
      ),
    );
  }
}

