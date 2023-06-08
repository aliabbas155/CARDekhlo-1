// Flutter imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:car_dekh_lo/config/app_colors.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../config/constants.dart';

void showSnackBar(
    {required String msg,
    Color? backColor,
    String? titleMsg,
    Color? textColor,
    IconData? iconData}) {
  Get.snackbar(
    "",
    '',

    icon: iconData != null
        ? Icon(
            iconData,
            color: textColor ?? AppColors.textColor,
          )
        : null,
    snackPosition: SnackPosition.TOP,
    backgroundColor: backColor ?? AppColors.whiteColor,
    borderRadius: 12,
    // messageText: Text(msg,
    //     style: Get.textTheme.bodyLarge
    //         ?.copyWith(color: textColor ?? AppColors.textColor)),
    margin: const EdgeInsets.all(4),
    colorText: textColor ?? AppColors.primaryColor,
    titleText: Text(msg,
        style: Get.textTheme.bodyLarge
            ?.copyWith(color: textColor ?? Colors.black)),
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
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: backColor ?? Colors.red,
    textColor: textColor ?? Colors.white,
  );
}

AwesomeDialog getErrorDialog({Widget? body, String? desc}) {
  return AwesomeDialog(
    context: Get.context!,
    isDense: true,
    padding: const EdgeInsets.symmetric(horizontal: 2),
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: 'Error',
    body: body,
    desc: desc,
    btnOkOnPress: () {
      Get.back();
      try {} catch (e) {
        log.e(e);
      }
    },
    btnOkIcon: Icons.cancel,
    btnOkColor: Colors.red,
  );
}

AwesomeDialog getSuccessDialog({Widget? body, String? desc}) {
  return AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    isDense: true,
    padding: EdgeInsets.zero,
    headerAnimationLoop: false,
    title: 'Success',
    body: body,
    desc: desc,
    btnOkOnPress: () {
      Get.back();
    },
    btnOkIcon: Icons.check_circle_outline_rounded,
    btnOkColor: AppColors.primaryColor,
  );
}

AwesomeDialog getInfoDialog(
    {Widget? body, String? desc, String? title, DialogType? dialogType}) {
  return AwesomeDialog(
    context: Get.context!,
    dialogType: dialogType ?? DialogType.info,
    animType: AnimType.rightSlide,
    isDense: true,
    padding: EdgeInsets.zero,
    headerAnimationLoop: false,
    title: title ?? 'Info',
    body: body,
    desc: desc,
    btnOkOnPress: () {
      Get.back();
    },
    btnOkIcon: Icons.check_circle_outline_rounded,
    btnOkColor: AppColors.primaryColor,
  );
}
