import 'package:car_dekh_lo/config/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Components/constants.dart';
import '../services/toast_dialogs.dart';

class MapController extends GetxController {
  static MapController instance = Get.find();
  late CollectionReference _mainCollection;

  _getCollectionRef() {
    final CollectionReference tempRef;

    tempRef = firestore.collection('showroom');

    return tempRef;
  }

  getShowRoomStream() {
    _mainCollection = _getCollectionRef();
    try {
      return _mainCollection

          // .startAfter(lastDoc)
          .snapshots();
    } on FirebaseException catch (e) {
      showSnackBar(
        msg: 'Error',
      );
      log.e(e);
    }
  }
  // Future<ShowRoomModel> getGoogleOffices() async {
  // const googleLocationsURL = 'https://about.google/static/data/locations.json';

  // // Retrieve the locations of Google offices
  // try {
  //   final response = await firestore.get(Uri.parse(googleLocationsURL));
  //   if (response.statusCode == 200) {
  //     return ShowRoomModel.fromJson(
  //         json.decode(response.body) as Map<String, dynamic>);
  //   }
  // } catch (e) {
  //   if (kDebugMode) {
  //     print(e);
  //   }
  // }
}
