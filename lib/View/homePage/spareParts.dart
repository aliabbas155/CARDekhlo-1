import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class Spareparts extends StatelessWidget {
  final List<String> images = [
    'assets/bg.jpg',
    'assets/bg.jpg',
    'assets/bg.jpg',
    'assets/bg.jpg',
  ];

  Spareparts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 30),
        child: ListView(
          children: [
            SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 268,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/Back_Button.png')),
                      ],
                    ),
                  ),
                  Container(
                    height: 200.0,
                    margin: const EdgeInsets.only(left: 18, right: 42, top: 5),
                    padding: const EdgeInsets.all(13),
                    width: MediaQuery.of(context).size.width - 60,
                    child: Carousel(
                      dotSpacing: 15.0,
                      dotSize: 6.0,
                      dotIncreasedColor: Colors.red,
                      dotBgColor: Colors.transparent,
                      indicatorBgPadding: 10.0,
                      dotPosition: DotPosition.bottomCenter,
                      images: images
                          .map((item) => Image.asset(
                                item,
                                fit: BoxFit.cover,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Honda Civic Fender Light \nComplate set of 2pc ',
              style: blackTektFont1.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              'They show the rear edge of the vehicle to allow other drivers to appropriately gauge the size and shape of the car.  ',
              style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey[500]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 13),
              height: 50,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                  color: bulao,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        'Rs:2000',
                        style: blackTektFont1.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('Main Freature',
                style: blackTektFont1.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600)),
            Container(
              margin: const EdgeInsets.only(top: 10, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: bulao2,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Image.asset('assets/Lock.png'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Security',
                            style: blackTektFont1.copyWith(fontSize: 12),
                          ),
                          Text(
                            'Smart Lock',
                            style: blackTektFont1.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: bulao2,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Image.asset('assets/speedometer.png'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Life',
                            style: blackTektFont1.copyWith(fontSize: 12),
                          ),
                          Text(
                            'Best Quality',
                            style: blackTektFont1.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: bulao2,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Image.asset('assets/engine.png'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Engine',
                            style: blackTektFont1.copyWith(fontSize: 12),
                          ),
                          Text(
                            '2,5L 4-Silinder',
                            style: blackTektFont1.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: bulao2,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Image.asset('assets/kursi.png'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Seats',
                            style: blackTektFont1.copyWith(fontSize: 12),
                          ),
                          Text(
                            '4 People',
                            style: blackTektFont1.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 47, right: 30),
              height: 55,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Center(
                  child: Text(
                'For details Call Showroom',
                style:
                    blackTektFont1.copyWith(fontSize: 16, color: Colors.white),
              )),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
