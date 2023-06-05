// import 'package:flutter/material.dart';

// import 'View/homePage/home_page.dart';
// import 'View/splash_screen.dart';
// import 'services/auth.dart';

// class FirstScreen extends StatefulWidget {
//   const FirstScreen({Key? key}) : super(key: key);

//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }

// class _FirstScreenState extends State<FirstScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Auth().authStateChanges,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return HomePage();
//         } else {
//           return const WelcomeScreen();
//         }
//       },
//     );
//   }
// }
