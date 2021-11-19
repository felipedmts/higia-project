import 'package:flutter/material.dart';
import 'package:get/get.dart';

mySnackBar(
  String? title,
  String? message,
  IconData? myIcon,
  MaterialColor? iconColor,
) {
  return Get.snackbar(
    title!,
    message!,
    colorText: Colors.white,
    animationDuration: Duration(seconds: 3),
    icon: Icon(
      myIcon,
      color: iconColor,
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Color.fromRGBO(36, 38, 38, 1),
  );
}
