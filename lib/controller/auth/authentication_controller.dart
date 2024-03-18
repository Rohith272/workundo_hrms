
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workundo_hrms/model/response/login_response.dart';
import 'package:workundo_hrms/model/response/session_response.dart';
import 'package:workundo_hrms/service/api_helper.dart';
import 'package:workundo_hrms/views/screens/Login/login.dart';
import 'package:workundo_hrms/views/screens/home/home_screen.dart';

class AuthController extends GetxController{

  var isLoading = false.obs;

  login(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoading.value = true;
    LoginResponse? loginResponse = await APIHelper().login(username, password);

    if (loginResponse != null) {
      if (loginResponse.success == true) {
        prefs.setString("token", loginResponse.token ?? "");
        Get.off(const HomeScreen());
        // if (kDebugMode) {
        //   print('LOGGED IN USER ID ==== ${loginResponse.employeeId}');
        // }
        // prefs.setString(
        //   "employeeId",
        //   loginResponse.employeeId.toString(),
        // );
        // if (loginResponse.passwordMustBeChanged!) {
        //   // Get.offAll(ChangePassword(
        //   //   isFirst: true,
        //   // ));
        // } else {
        //   Get.offAll(const HomeScreen());
        // }
        isLoading.value = false;
      }
      // else if (loginResponse.success == false && loginResponse.passwordMustBeChanged == true) {
      //   final SharedPreferences prefs = await SharedPreferences.getInstance();
      //
      //   prefs.setString("email", username);
      //   // Get.offAll(ChangePassword(
      //   //   isFirst: true,
      //   // ));
      // }
      // else {
      //   showToast(message: loginResponse.errorMessage ?? "");
      // }
      isLoading.value = false;
    }else {
      isLoading.value = false;
    }

    isLoading.value = false;
  }

  checkForSession() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name = preferences.getString("token");
    if(name != null){
      SessionResponse? response = await APIHelper().validateSession(name);
      if(response?.success ?? false){
        Get.to(HomeScreen());
      }
      else{
        // Get.to(const HomeScreen());
        Get.to(const LoginScreen());
      }
    }
    else{
      // Get.to(const HomeScreen());
      Get.to(const LoginScreen());
    }
  }

}