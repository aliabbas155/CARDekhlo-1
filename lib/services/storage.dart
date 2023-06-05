import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../config/firebase.dart';



class Storage {
  List<File>? images = [];
  List<String>? imagesName = [];
  final ImagePicker _picker = ImagePicker();

  getImageFromCamera() async {
    final XFile? captureImage =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 70);
    if (captureImage == null) {
      Fluttertoast.showToast(msg: 'Nothing Selected');
      Fluttertoast.showToast(msg: 'Must Select One Image!');
      return null;
    }
    images?.add(File(captureImage.path));
    imagesName?.add(captureImage.name);
  }

  getMultipleImages() async {
    final List<XFile> pickedImages =
        await _picker.pickMultiImage(imageQuality: 70);
    for (var e in pickedImages) {
      images?.add(File(e.path));
      imagesName?.add(e.name);
    }
  }

  imageSourceForCar(BuildContext context) async {
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size(50, 44),
                ),
                child: const Text('Camera'),
                onPressed: () async {
                  await storage.getImageFromCamera();
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size(100, 44),
                ),
                child: const Text('Select'),
                onPressed: () async {
                  await getMultipleImages();
                  Get.back();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  String? uid = FirebaseAuth.instance.currentUser!.email;

  Future<String?> uploadFile(File files, String names) async {
    try {
      final taskSnapshot = await firebaseStorage
          .ref('car images/$uid/$names')
          .putFile(files)
          .whenComplete(() => null);
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }
}
