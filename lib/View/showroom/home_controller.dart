import 'dart:async';

import 'package:car_dekh_lo/config/constants.dart';
import 'package:car_dekh_lo/config/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../config/app_colors.dart';
import 'permissions/app_permission_controller.dart';
import 'permissions/toast_dialogs.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();

//location status
  var locationSection = AppPermissions.getLocation.obs;

  //var for settings
  Completer<GoogleMapController> controller = Completer();
  Location location = Location();
  late GoogleMapController googleMapController;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentStoreIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentHomeIcon = BitmapDescriptor.defaultMarker;

  // // Map variables
  var isLoading = true.obs;
  var currentPolyline = Rxn<Polyline>();
  // var currentPolyline = (null as ).obs;
  var currentLat = 0.0.obs;
  var currentLong = 0.0.obs;
  var zoomLevel = 14.0.obs;
  var allMarkers = <Marker>[].obs;
  var startLocation = Rxn<LatLng>();
  var endLocation = Rxn<LatLng>();

  late StreamSubscription<LocationData> locationSubscription;

  @override
  void onInit() {
    super.onInit();
    log.d('On ready');
    initialSetup();
  }

  initialSetup() {
    getCurrentLocation();
    setCustomMarkerIcon();
  }

  @override
  void onClose() {
    log.d("on Home dispose");
    //  Get.delete<HomeController>();
    resetValues();
    googleMapController.dispose();
    locationSubscription.cancel();
    super.onClose();
  }

//sets custom markers on map for users
  void setCustomMarkerIcon() async {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(
              devicePixelRatio: 2.5,
            ),
            'assets/destination_map_marker.png')
        .then((value) {
      currentLocationIcon = value;
    });
  }

  //sets the camera view to delivery markers if an order is received
  Future<void> updateCameraLocation(
    LatLng source,
    LatLng destination,
    GoogleMapController? mapController,
  ) async {
    if (mapController == null) return;

    LatLngBounds bounds;

    if (source.latitude > destination.latitude &&
        source.longitude > destination.longitude) {
      bounds = LatLngBounds(southwest: destination, northeast: source);
    } else if (source.longitude > destination.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(source.latitude, destination.longitude),
          northeast: LatLng(destination.latitude, source.longitude));
    } else if (source.latitude > destination.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destination.latitude, source.longitude),
          northeast: LatLng(source.latitude, destination.longitude));
    } else {
      bounds = LatLngBounds(southwest: source, northeast: destination);
    }

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 70);

    return checkCameraLocation(cameraUpdate, mapController);
  }

  //checks the camera view to delivery markers if an order is received
  Future<void> checkCameraLocation(
      CameraUpdate cameraUpdate, GoogleMapController mapController) async {
    mapController.animateCamera(cameraUpdate);
    LatLngBounds l1 = await mapController.getVisibleRegion();
    LatLngBounds l2 = await mapController.getVisibleRegion();

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      return checkCameraLocation(cameraUpdate, mapController);
    }
  }

  //adds markers for delivery locations
  addShowRoomMarkers() async {
    final clubsList = await mapController.fetchClubs();

    allMarkers.clear();
    for (final club in clubsList) {
      final marker = Marker(
        markerId: MarkerId(club.id),
        visible: true,
        position: LatLng(club.address.latitude, club.address.longitude),
        infoWindow: InfoWindow(
            title: club.name,
            snippet: club.description,
            onTap: () {
              log.d(club);
//TODO: add go to screen of showroom here
              // Get.to(
              //     () => EntryInfoScreen(
              //           club: club,
              //         ),
              //     transition: Transition.native);
            }),
      );
      allMarkers.add(marker);
    }
  }

//resets the home map values
  resetValues() {
    isLoading.value = true;
    currentPolyline.value = null;
    controller = Completer();
    currentLat.value = 0.0;
    currentLong.value = 0.0;
    zoomLevel.value = 16.0;
    startLocation.value = null;

    endLocation.value = null;
    resetPolylineMarker();
  }

//resets the polylines to default
  resetPolylineMarker() {
    allMarkers.clear();
  }

  /// Check if the pick file permission is granted,
  /// if it's not granted then request it.
  /// If it's granted then invoke the file picker
  Future<void> checkLocationPermission() async {
    await AppPermissionController.requestLocationPermission();
    isLoading.value = false;
  }

//get current location of user and display it on map
  void getCurrentLocation() async {
    await Future.delayed(const Duration(seconds: 1));
    var status = await Permission.location.isGranted;
    if (!status) {
      var infoDialog =
          getInfoDialog(desc: kLocationAccessText, title: 'Use your Location');
      await infoDialog.show();
    }
    checkLocationPermission();

    try {
      bool ison = await location.serviceEnabled();
      if (!ison) {
        locationSection.value = AppPermissions.notEnabled;
        AppPermissionController.openLocationSettingsDialog();
      }

      if (homeController.locationSection.value == AppPermissions.granted) {
        try {
          // await location.getLocation();
          var tempLoc = await location.getLocation();

          _updateLatLng(tempLoc);
          //Update Location when online
        } catch (e) {
          debugPrint('Error getting location: $e');
          // Show an error to the user if the pick file failed

          showSnackBar(msg: 'An error occurred when getting location');
          return;
        }
      }
      googleMapController = await controller.future;

      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(currentLat.value, currentLong.value), zoom: 16)));
      locationSubscription = location.onLocationChanged.listen((newLoc) {
        _updateLatLng(newLoc);

        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                //-0
                target: LatLng(currentLat.value, currentLong.value),
                zoom: 16),
          ),
        );
      });
    } catch (e) {
      log.e(e);

      showToast(
          msg: 'Error Getting Location.',
          backColor: AppColors.primaryColor,
          textColor: AppColors.whiteColor);
    }
  }

//updates the current location of user in home Controller variable
  _updateLatLng(LocationData locationData) {
    currentLat.value = locationData.latitude ?? 0.0;
    currentLong.value = locationData.longitude ?? 0.0;

    isLoading.value = false;
  }
}
