import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workundo_hrms/utils/enum.dart';

class RouterController extends GetxController{

  var indexStack = <int>[].obs;
  var stack = <Widget>[].obs;

  Future<void> onWillPop() async {
    // mainLayoutController.isSearch.value = false;
    // searchKeyController.clear();
    if (stack.length == 1 || indexStack.last == Screens.projectScreen) {
      exit(0);
    } else {
      stack.removeLast();
      indexStack.removeLast();
    }
  }
}