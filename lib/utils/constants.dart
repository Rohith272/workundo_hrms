import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


import 'colors.dart';

showToast({
  @required String? message,
  Toast toastLength = Toast.LENGTH_LONG,
  Color backgroundColor = primaryTeal,
}) {
  Fluttertoast.showToast(
    msg: message!,
    backgroundColor: backgroundColor,
    toastLength: toastLength,
  );
}

String parseToDay(String date) {
  if (date == "" || date == "NA") {
    return "";
  } else {
    DateTime tempDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date);
    int day = tempDate.day;
    String monthAbbreviation = DateFormat('MMM').format(tempDate);

    String formattedDate = '$day $monthAbbreviation';
    return formattedDate;
  }
}
