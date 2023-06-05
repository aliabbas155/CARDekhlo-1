// Flutter imports:
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';
// Project imports:

void showSnackBar(
    {required String msg,
    Color? backColor,
    Color? textColor,
    IconData? iconData}) {
  Get.snackbar(
    "",
    '',
    icon: Icon(iconData ?? Icons.close_rounded, color: Colors.white),
    snackPosition: SnackPosition.TOP,
    backgroundColor: backColor ?? Colors.white,
    borderRadius: 20,
    messageText: Text(msg, style: Get.textTheme.titleLarge),
    margin: const EdgeInsets.all(10),
    colorText: textColor ?? Colors.black,
    duration: const Duration(seconds: 2),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

void showToast({required String msg, Color? backColor, Color? textColor}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: backColor ?? Colors.black,
    textColor: textColor ?? Colors.white,
  );
}

ProgressDialog getProgressDialog(
    {required String title,
    required String msg,
    required BuildContext context,
    Color? textColor}) {
  return ProgressDialog(
    context,
    title: Text(title, style: TextStyle(color: textColor ?? Colors.black)),
    message: Text(msg, style: TextStyle(color: textColor ?? Colors.black)),
    dismissable: false,
    blur: 2,
  );
}
