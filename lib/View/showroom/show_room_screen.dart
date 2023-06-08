// // Flutter imports:
// import 'package:car_dekh_lo/config/controllers.dart';
// import 'package:flutter/material.dart';
// // Package imports:
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class ShowRoomScreen extends StatefulWidget {
//   const ShowRoomScreen({Key? key}) : super(key: key);

//   @override
//   State<ShowRoomScreen> createState() => _ShowRoomScreenState();
// }

// class _ShowRoomScreenState extends State<ShowRoomScreen> {
//   late GoogleMapController _controller;
//   final LatLng _initialcameraposition = const LatLng(20.5937, 78.9629);
//   // final Location _location = Location();
//   final Map<String, Marker> _markers = {};
//   void _onMapCreated(GoogleMapController cntlr) async {
//     _controller = cntlr;

//     final clubsList = await mapController.fetchClubs();

//     setState(() {
//       _markers.clear();
//       for (final club in clubsList) {
//         final marker = Marker(
//           markerId: MarkerId(club.id),
//           visible: true,
//           position: LatLng(club.address.latitude, club.address.longitude),
//           infoWindow: InfoWindow(
//               title: club.name,
//               snippet: club.description,
//               onTap: () {
//                 // log.d(club);
// //TODO: add go to screen of showroom here
//                 // Get.to(
//                 //     () => EntryInfoScreen(
//                 //           club: club,
//                 //         ),
//                 //     transition: Transition.native);
//               }),
//         );
//         _markers[club.id] = marker;
//       }
//       // _controller.animateCamera()
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       extendBodyBehindAppBar: true,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             GoogleMap(
//               mapType: MapType.hybrid,
//               mapToolbarEnabled: true,
//               myLocationButtonEnabled: true,
//               zoomControlsEnabled: true,
//               minMaxZoomPreference: const MinMaxZoomPreference(10, 18),
//               initialCameraPosition:
//                   CameraPosition(target: _initialcameraposition),
//               markers: _markers.values.toSet(),
//               onMapCreated: _onMapCreated,
//               myLocationEnabled: true,
//               scrollGesturesEnabled: true,
//               zoomGesturesEnabled: true,
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//             //   child: Column(
//             //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//             //     mainAxisSize: MainAxisSize.min,
//             //     children: [
//             //       Row(
//             //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //         children: [
//             //           Text(
//             //             'Hello',
//             //             style: Get.textTheme.headlineMedium,
//             //           ),
//             //           ElevatedButton(
//             //             onPressed: () {},
//             //             style: ElevatedButton.styleFrom(
//             //               shape: const CircleBorder(),
//             //             ),
//             //             child: const Icon(
//             //               Icons.circle_rounded,
//             //             ),
//             //           ),
//             //         ],
//             //       ),
//             //       SizedBox(
//             //         height: Get.size.height * 0.02,
//             //       ),
//             //       Text(
//             //         'ShowRoom',
//             //         style: Get.textTheme.titleLarge,
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
