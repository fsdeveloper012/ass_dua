import 'dart:io';

import 'package:aas/constants/colors.dart';
import 'package:aas/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomSnackbar {
  static successful({
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.green,
    Color textColor = black,
  }) {
    Get.snackbar(textConstants.companyName, message,
        duration: duration,
        backgroundColor: backgroundColor,
        colorText: textColor,
        snackPosition: SnackPosition.BOTTOM,
        messageText: Text(
          message,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ));
  }

  static void error({
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.red,
    Color textColor = white,
  }) {
    Get.snackbar('Failed', message,
        duration: duration,
        backgroundColor: backgroundColor,
        colorText: textColor,
        snackPosition: SnackPosition.BOTTOM,
        messageText: Text(
          message,
          style: TextStyle(color: white, fontWeight: FontWeight.w400),
        ));
  }
}
