import 'package:flutter/material.dart';

import '../splash_screen.dart';
import 'theme.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 19,
                width: 20,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/home.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                'Home',
                style: blackTektFont1.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w600),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 14,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/save.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                'Save',
                style: blackTektFont1.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: greyColor),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()));
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  iconSize: 25,
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                'Profile',
                style: blackTektFont1.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: greyColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
