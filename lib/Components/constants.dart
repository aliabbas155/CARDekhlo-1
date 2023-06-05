import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../View/register_pages/login_screen.dart';

Logger log = Logger();
const kUserCredSharedPrefKey = 'userCredential';
const kUserTypeSharedPrefKey = 'userType';

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

//   deleteDialog(BuildContext context, VoidCallback onPressed) async {
//     return await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               elevation: 8.0,
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(30))),
//               backgroundColor: const Color(0xFF264077),
//               actions: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         onPressed();
//                       },
//                       style: TextButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         backgroundColor: const Color(0xFF00003B),
//                       ),
//                       child: const Text(
//                         "Yes",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       style: TextButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         backgroundColor: const Color(0xFF00003B),
//                       ),
//                       child: const Text(
//                         "No",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                   ],
//                 )
//               ],
//               content: Form(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   // ignore: prefer_const_literals_to_create_immutables
//                   children: [
//                     const Text(
//                       'Are you sure !',
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                       ),
//                     ),
//                     const Text(
//                       '(you want to delete!)',
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }



// const kSignupTextField = InputDecoration(
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(20),
//     ),
//   ),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.orange, width: 4),
//     borderRadius: BorderRadius.all(
//       Radius.circular(20),
//     ),
//   ),
// );
