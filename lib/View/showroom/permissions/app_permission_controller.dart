// to avoid confusion with google_maps_flutter package
import 'package:car_dekh_lo/config/app_colors.dart';
import 'package:car_dekh_lo/services/toast_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../config/constants.dart';
import '../../../config/controllers.dart';

enum AppPermissions {
  getLocation,
  notEnabled,
  granted,
  denied,
  restricted,
  permanentlyDenied,
}

class AppPermissionController {
  static Future<PermissionStatus> getLocationStatus() async {
    // homeController.location.requestPermission();
    final status = await Permission.location.request();

    return status;
  }

  static Future<PermissionStatus> getCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied) {
      status = await Permission.camera.request();
    }
    return status;
  }

  static Future<bool> isLocationServiceEnabled() async {
    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      return true;
      // return false;
    }
    log.d('Service disabled');

    return false;
  }

  static Future<bool> requestLocationPermission() async {
    // Call Location status function here
    final status = await getLocationStatus();
    log.d(status);

    // if permission is granted or limited call function
    if (status == PermissionStatus.granted ||
        status == PermissionStatus.limited) {
      homeController.locationSection.value = AppPermissions.granted;
      return true;
    }
    if (status.isPermanentlyDenied) {
      homeController.locationSection.value = AppPermissions.permanentlyDenied;
    }

    return false;
  }

  static void openLocationSettingsDialog() {
    Get.defaultDialog(
      title: 'Location',
      titleStyle: const TextStyle(
        color: Colors.black,
      ),
      backgroundColor: AppColors.whiteColor,
      middleTextStyle: const TextStyle(color: AppColors.textColor),
      middleText: 'Please make sure you enable location and try again',
      actions: [
        const Text(
          'Enable Location Services.',
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: AppColors.textColor),
        ),
      ],
      confirm: ElevatedButton(
          onPressed: () async {
            // openAppSettings();
            bool isturnedon = await homeController.location.requestService();
            if (isturnedon) {
              log.i("GPS device is turned ON");
              // return;
            } else {
              showToast(
                  msg: 'Location service is not enabled',
                  backColor: AppColors.primaryColor,
                  textColor: AppColors.whiteColor);
            }
            homeController.checkLocationPermission();
            Get.back();
          },
          child: const Text('Enable')),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        child: const Text('Cancel'),
      ),
    );
  }
}
