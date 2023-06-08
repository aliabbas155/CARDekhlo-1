import 'package:car_dekh_lo/View/showroom/permissions/app_permission_controller.dart';
import 'package:car_dekh_lo/View/showroom/permissions/location_permissions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../config/app_colors.dart';
import '../../config/controllers.dart';
import 'loading_animation.dart';

class ShowRoomScreen extends StatelessWidget {
  const ShowRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      key: homeController.scaffoldKey,
      extendBodyBehindAppBar: true,

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const LocationButton(),
      body: Obx(
        () => Visibility(
          visible: homeController.isLoading.value,
          replacement: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Visibility(
                  visible: homeController.locationSection.value ==
                      AppPermissions.granted,
                  child: GoogleMap(
                    // zoomControlsEnabled: false,
                    padding: const EdgeInsets.only(top: 30),
                    myLocationEnabled: false,
                    myLocationButtonEnabled: false,
                    zoomGesturesEnabled: true,
                    scrollGesturesEnabled: true,

                    zoomControlsEnabled: true,
                    minMaxZoomPreference: const MinMaxZoomPreference(10, 18),
                    initialCameraPosition: CameraPosition(
                      target: LatLng(homeController.currentLat.value,
                          homeController.currentLong.value),
                    ),

                    markers: Set.from(homeController.allMarkers.value)
                      ..add(Marker(
                          markerId: const MarkerId("current"),
                          infoWindow:
                              const InfoWindow(title: "Current Location"),
                          visible: true,
                          position: LatLng(homeController.currentLat.value,
                              homeController.currentLong.value),
                          icon: homeController.currentLocationIcon)),

                    onMapCreated: (mapController) {
                      if (!homeController.controller.isCompleted) {
                        homeController.controller.complete(mapController);
                      }
                    },
                  ),
                ),
                Visibility(
                  visible: homeController.locationSection.value !=
                      AppPermissions.granted,
                  child: LocationPermissions(
                    isPermanent: homeController.locationSection.value ==
                        AppPermissions.permanentlyDenied,
                    onPressed: () => homeController.getCurrentLocation(),
                  ),
                ),
              ],
            ),
          ),
          child: const LoadingAnimation(),
        ),
      ),
    );
  }
}

class LocationButton extends StatelessWidget {
  const LocationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.17.sh),
      child: FloatingActionButton(
        onPressed: () => homeController.getCurrentLocation(),
        tooltip: "My Location",
        shape: CircleBorder(
          side: BorderSide(
            color: AppColors.textColor.withOpacity(0.3),
          ),
        ),
        mini: true,
        backgroundColor: AppColors.cardColor,
        child: const Icon(Icons.location_searching_outlined),
      ),
    );
  }
}
