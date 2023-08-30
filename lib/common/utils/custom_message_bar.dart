import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMessageBar {
  static void makeSnackBar(
      {String message = '',
      String title = '',
      int durationSec = 2,
    required  SnackType type }) {
    Get.snackbar(
      '',
      'try again',
      // messageText: Text(
      //   message,
      //   style: const TextStyle(
      //     fontSize: 14,
      //     color: Colors.white70,
      //   ),
      // ),
      titleText: Text(
        message,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      padding: const EdgeInsets.all(10),
      backgroundColor: type == SnackType.error ? Colors.red : Colors.green,
      duration: Duration(seconds: durationSec),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

enum SnackType { error, success }
