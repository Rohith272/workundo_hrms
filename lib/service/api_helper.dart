import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workundo_hrms/model/response/login_response.dart';
import 'package:workundo_hrms/model/response/pending_count_response.dart';
import 'package:workundo_hrms/model/response/project_list_response.dart';
import 'package:workundo_hrms/model/response/session_response.dart';
import 'package:workundo_hrms/model/response/task_list_response.dart';
import 'package:workundo_hrms/service/api_service.dart';
import 'package:workundo_hrms/service/api_urls.dart';
import 'package:workundo_hrms/service/exception_handler.dart';
import 'package:workundo_hrms/utils/constants.dart';

class APIHelper {
  String baseUrl = APIUrls.devURL;
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<LoginResponse?> login(String username, String password) async {
    final String url = baseUrl + APIUrls.login;

    String body = json.encode({"username": username, "password": password});

    try {
      Response? response = await APIService().postAPICall(url, body, headers);
      var responseData = json.decode(response!.body);

      if (response.statusCode == 200){
        return LoginResponse.fromJson(responseData);
      } else if (responseData != null && responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      }
      else{
        showToast(message: "Something went wrong");
        return null;
      }
    }
    catch (e) {
      if (kDebugMode) {
        print("Error type: ${e.runtimeType..toString()}");
      }
      String errorMessage = ExceptionHandlers().getExceptionString(e);
      showToast(message: errorMessage);
      print("API error: $errorMessage");
    }
  }

  Future<SessionResponse?> validateSession(String token) async {
    final String url = baseUrl + APIUrls.validateSession;

    String body = json.encode({"sessionId": token});

    try {
      Response? response = await APIService().postAPICall(url, body, headers);
      var responseData = json.decode(response!.body);

      if (response.statusCode == 200){
        return SessionResponse.fromJson(responseData);
      } else if (responseData != null && responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      }
      else{
        showToast(message: "Something went wrong");
        return null;
      }
    }
    catch (e) {
      if (kDebugMode) {
        print("Error type: ${e.runtimeType..toString()}");
      }
      String errorMessage = ExceptionHandlers().getExceptionString(e);
      showToast(message: errorMessage);
      print("API error: $errorMessage");
    }
  }

  Future<ProjectListResponse?> getProjectList() async{
    final String url = baseUrl + APIUrls.getProjectList;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");

    try {
      headers['Authorization'] = token ?? "";

      Response? response = await APIService().getAPICall(url, headers);
      var responseData = json.decode(response!.body);

      if (response.statusCode == 200) {
        return ProjectListResponse.fromJson(responseData);
      } else if (responseData != null &&
          responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      } else {
        showToast(message: "Something went wrong!");
      }
      return null;
    } catch (e) {
      print("Error type: ${e.runtimeType..toString()}");
      String errorMessage = ExceptionHandlers().getExceptionString(e);
      showToast(message: errorMessage);
      print("API error: $errorMessage");
      if (e is FormatException) {
        // goToLogin();
      }
    }
  }

  Future<TaskListResponse?> getTaskList() async{
    final String url = baseUrl + APIUrls.getTaskList;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");

    try {
      headers['Authorization'] = token ?? "";

      Response? response = await APIService().getAPICall(url, headers);
      var responseData = json.decode(response!.body);

      if (response.statusCode == 200) {
        return TaskListResponse.fromJson(responseData);
      } else if (responseData != null &&
          responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      } else {
        showToast(message: "Something went wrong!");
      }
      return null;
    } catch (e) {
      print("Error type: ${e.runtimeType..toString()}");
      String errorMessage = ExceptionHandlers().getExceptionString(e);
      showToast(message: errorMessage);
      print("API error: $errorMessage");
      if (e is FormatException) {
        // goToLogin();
      }
    }
  }

  Future<PendingCountResponse?> getBasicDetails() async{
    final String url = baseUrl + APIUrls.basicDetails;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");

    try {
      headers['Authorization'] = token ?? "";

      Response? response = await APIService().getAPICall(url, headers);
      var responseData = json.decode(response!.body);

      if (response.statusCode == 200) {
        return PendingCountResponse.fromJson(responseData);
      } else if (responseData != null &&
          responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return null;
      } else {
        showToast(message: "Something went wrong!");
      }
      return null;
    } catch (e) {
      print("Error type: ${e.runtimeType..toString()}");
      String errorMessage = ExceptionHandlers().getExceptionString(e);
      showToast(message: errorMessage);
      print("API error: $errorMessage");
      if (e is FormatException) {
        // goToLogin();
      }
    }
  }

  Future<bool> checkIn() async {
    final String url = baseUrl + APIUrls.checkIn;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    String body = json.encode({"sessionId": token});

    try {
      headers['Authorization'] = token ?? "";

      Response? response = await APIService().postAPICall(url, body,headers);
      var responseData = json.decode(response!.body);

      if (response.statusCode == 200) {
        return responseData.isSuccess;
      } else if (responseData != null &&
          responseData.contains("errorMessage")) {
        showToast(message: responseData["errorMessage"]);
        return false;
      } else {
        showToast(message: "Something went wrong!");
        return false;
      }
    } catch (e) {
      if (e is FormatException) {
        // goToLogin();
      }
      // Return a default value in case of error
      return false;
    }
  }

  Future<bool> checkOut() async {
    final String url = baseUrl + APIUrls.checkOut;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    String body = json.encode({"sessionId": token});

    try {
      headers['Authorization'] = token ?? "";

      Response? response = await APIService().postAPICall(url, body,headers);
      var responseData = json.decode(response!.body);

      if (response.statusCode == 200) {
        return responseData.isSuccess;
      } else {
        showToast(message: "Something went wrong!");
        return false;
      }
    } catch (e) {
      if (e is FormatException) {
        // goToLogin();
      }
      // Return a default value in case of error
      return false;
    }
  }
}