// ignore_for_file: unnecessary_cast


import 'package:car_dekh_lo/config/constants.dart';
import 'package:car_dekh_lo/config/firebase.dart';
import 'package:car_dekh_lo/services/toast_dialogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model/car_model.dart';

class CarController extends GetxController {
  static CarController instance = Get.find();
  late CollectionReference _mainCollection;
  var carLeft = (null as CarModel?).obs;
  var carRight = (null as CarModel?).obs;

  getCarStream() {
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

  getCustomerSpecificRecord(String id) async {
    _mainCollection = _getCollectionRef();

    // var data = await _mainCollection.doc(id).get();

    Query query = _mainCollection.where("carModel", isEqualTo: id);

// 3. Execute the query to get the documents
    QuerySnapshot querySnapshot = await query.get();

// 4. Loop over the resulting document(s), since there may be multiple
    for (var doc in querySnapshot.docs) {
      // 5. Update the 'Full Name' field in this document
      log.d(doc.data());
    }

    // try {
    //   return CarModel.fromSnapshot(data);
    // } catch (e) {
    //   log.e(e);
    //   return null;
    // }
  }

  // _getCashInOutCollectionRef() {
  //   final CollectionReference tempRef;
  //   // if (loginController.isMerchant()) {
  //   //   tempRef = firestore.collection(kMerchantDb);
  //   // } else {
  //   //   tempRef = firestore.collection(kUserDb);
  //   // }
  //   tempRef = firestore.collection(kUserDb);
  //   return tempRef;
  // }

  _getCollectionRef() {
    final CollectionReference tempRef;

    tempRef = firestore.collection(kCarCollection);

    return tempRef;
  }
}
