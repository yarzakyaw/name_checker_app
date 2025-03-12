import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperGetxController extends GetxController {
  /* -- ============= SNACK-BARS ================ -- */

  static successSnackBar({
    required String title,
    required String message,
  }) {
    final isDark =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: isDark ? Colors.white : Colors.greenAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  static errorSnackBar({
    required title,
    message,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }

  /* static warningSnackBar({
    required title,
    message,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: mingalarWhiteColor,
      backgroundColor: mingalarOnBoardingPage3Color,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        LineAwesomeIcons.exclamation_circle_solid,
        color: mingalarWhiteColor,
      ),
    );
  }

  static modernSnackBar({required title, message}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.blueGrey,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(tDefaultSpace - 10),
    );
  } */
}
