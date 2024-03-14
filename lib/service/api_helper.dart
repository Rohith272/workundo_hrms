import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:http/http.dart';
import 'package:http/src/response.dart';
import 'package:workundo_hrms/model/response/login_response.dart';
import 'package:workundo_hrms/model/response/session_response.dart';
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
}