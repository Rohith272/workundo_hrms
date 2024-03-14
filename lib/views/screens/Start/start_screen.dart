import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workundo_hrms/controller/auth/authentication_controller.dart';
import 'package:workundo_hrms/utils/images.dart';
import 'package:workundo_hrms/views/screens/Login/login.dart';
import '../../../../utils/colors.dart';
import 'package:get/get.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  String? name;
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(Images.backgroundImage, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, fit: BoxFit.fill,),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 32),
                child: Image.asset(Images.logo, width: 181, height: 48,),
              ),
              Container(
                margin: EdgeInsets.only(left: 32, top: MediaQuery.of(context).size.height*0.1,right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontFamily: 'Supreme',
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'worksync',
                        style: TextStyle(
                          fontFamily: 'Syncopate',
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.none
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 32, top: MediaQuery.of(context).size.height*0.05,right: 10),
                child: const Text(
                    "Your Gateway to Synchronized Productivity",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Clash',
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    decoration: TextDecoration.none,

                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  await authController.checkForSession();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        greenGradientBottom,
                        greenGradientTop
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: const Center(
                    child: Text(
                        "Get Started",
                      style: TextStyle(
                        fontFamily: 'Clash',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}