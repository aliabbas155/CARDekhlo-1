import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Model/ad_data.dart';
import '../Model/car_model.dart';
import '../config/constants.dart';
import '../config/firebase.dart';
import 'auth.dart';

void uploadAdData(
  List<String> carImages,
  String adTitle,
  String carLocation,
  String carCompany,
  String carModel,
  String carVariant,
  String carRegistration,
  String carMilage,
  String carPrice,
  String carDescription,
) async {
  final reference = FirebaseFirestore.instance.collection(kAdsData).doc();

  final adsData = AdData(
      id: reference.id,
      userId: Auth().currentUser!.email.toString(),
      carImages: carImages,
      adTitle: adTitle,
      carLocation: carLocation,
      carCompany: carCompany,
      carModel: carModel,
      carVariant: carVariant,
      carRegistration: carRegistration,
      carMilage: carMilage,
      carPrice: carPrice,
      carDescription: carDescription);
  final json = adsData.toMap();
  await reference.set(json).onError((error, stackTrace) =>
      Fluttertoast.showToast(msg: 'Somthing went wrong'));

  Fluttertoast.showToast(msg: 'Uploaded Successfully');
}

Stream<List<AdData>> readAdData() =>
    firestore.collection(kAdsData).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => AdData.fromMap(doc.data())).toList());

// void uploadCars(
//   String id,
//   String company,
//   String model,
//   String gearType,
//   String horsePower,
//   String engine,
//   String seats,
//   String average,
//   String body,
//   String suspension,
//   List<dynamic> images,
// ) async {
//   final reference = FirebaseFirestore.instance.collection(kCarCollection).doc();

//   final cars = CarModel(
//       id: id,
//       company: company,
//       model: model,
//       engine: engine,
//       seats: seats,
//       average: average,
//       body: body,
//       suspension: suspension,
//       images: images,
//       gearType: gearType,
//       horsePower: horsePower);
//   final json = cars.toMap();
//   await reference.set(json).onError((error, stackTrace) =>
//       Fluttertoast.showToast(msg: 'Somthing went wrong'));

//   Fluttertoast.showToast(msg: 'Uploaded Successfully');
// }

Stream<List<CarModel>> readCars() =>
    firestore.collection(kCarCollection).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => CarModel.fromMap(doc.data())).toList());
