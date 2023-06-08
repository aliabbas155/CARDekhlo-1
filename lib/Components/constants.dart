import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/register_pages/login_screen.dart';

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(8),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    // borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightGreenAccent, width: 4),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
);

logoutUser(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Confirmation !!!'),
          content: const Text('Are you sure to Log Out ? '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(const LoginScreen());
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}

confirmationDialog(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Confirmation !!!'),
          content: const Text('Are you sure to leave this page ? '),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}
