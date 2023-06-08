import 'package:car_dekh_lo/Model/showroom_model.dart';
import 'package:car_dekh_lo/config/constants.dart';
import 'package:car_dekh_lo/config/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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

  Future<List<ShowRoomModel>> fetchClubs() async {
    var data = await firestore
        .collection('showroom')
        .orderBy(
          'name',
        )
        .get();
    log.d(data.docs.map((e) => log.d(ShowRoomModel.fromSnapshot(e))));
    try {
      return List.from(data.docs.map((e) => ShowRoomModel.fromSnapshot(e)));
    } catch (e) {
      log.e(e);
      return [];
    }
  }
}
