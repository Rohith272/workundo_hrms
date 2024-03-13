import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workundo_hrms/utils/theme.dart';
import 'package:workundo_hrms/views/screens/Start/start_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Workundo',
          theme: AppTheme.appTheme,
          home: const StartScreen(),
        );
      },
    );
  }
}
