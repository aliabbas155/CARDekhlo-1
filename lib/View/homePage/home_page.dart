import 'package:car_dekh_lo/View/auction/auction.dart';
import 'package:car_dekh_lo/View/showroom/show_screen.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Components/constants.dart';
import '../add_car_details_page.dart';
import '../compare_screen.dart';
import '../sparePartsPage/spare.dart';
import '../view_ad_page.dart';
import 'custom_tabbar.dart';
import 'theme.dart';

class HomePage extends StatelessWidget {
  final List<String> images = [
    'https://www.bentleymotors.com/content/dam/bentley/Master/homepage%20carousel/1920x1080_bentayga_ewb_2.jpg/_jcr_content/renditions/original.image_file.700.394.file/1920x1080_bentayga_ewb_2.jpg',
    'https://car-images.bauersecure.com/wp-images/2317/civic_typer_rivals_01.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY2dNfVnWBqaYIaEPWqeVYhetkEmgKXyAozQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm_QYRfv6q0f-ogG0Vw3WleWyLVyT8eBI2-mKYCuuvyduecJpsr00yHW6KWqInEtoc_sM&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyAjqBBmth-AJXgjr-ekTEONDOhIoclPnGJA&usqp=CAU',
    'https://www.cnet.com/a/img/resize/1e024a01ae63e402e22da463926bc11f04a1a909/hub/2021/06/25/ef1fc0ac-d839-4579-a846-8759f5cdafc0/2022-honda-civic-sport-sedan-007.jpg?auto=webp&width=1920',
  ];

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bulao,
      body: ListView(
        shrinkWrap: false,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.5],
                colors: [
                  Colors.red,
                  Colors.black,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Find the",
                      style: blackTektFont1.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("Perfect Vehicles",
                        style: blackTektFont1.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.redAccent)),
                  ],
                ),
                Text(
                  "For You",
                  style: blackTektFont1.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Row(children: [
                  Text(
                    "CarDekhlo helps you to find ",
                    style: blackTektFont1.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
          ),
          Container(
            height: 200.0,
            margin: const EdgeInsets.only(left: 2, right: 2, top: 2),
            padding: const EdgeInsets.all(2),
            width: MediaQuery.of(context).size.width - 60,
            child: Carousel(
              dotSpacing: 15.0,
              dotSize: 6.0,
              dotIncreasedColor: Colors.red,
              dotBgColor: Colors.transparent,
              indicatorBgPadding: 10.0,
              dotPosition: DotPosition.bottomCenter,
              images: images
                  .map((item) => Image.network(
                        item,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: const Text(
                              'Image Error!',
                              style: TextStyle(fontSize: 30),
                            ),
                          );
                        },
                      ))
                  .toList(),
            ),
          ),
          const TopMenus(),
          Container(
            margin: const EdgeInsets.only(left: 21, bottom: 0, top: 10),
            child: Text(
              'Catagories You Want',
              style: blackTektFont1.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          CatagoriesListBuild(
            onClicked: () {
              Get.to(() => const ShowRoomScreen());
            },
            title: 'Buy New Car',
            subtitle: 'With CarDekhlo',
            image: 'assets/buycarlogo.png',
          ),
          CatagoriesListBuild(
            onClicked: () {
              Get.to(const AddCarDetailsPage());
            },
            title: 'Post Ads',
            subtitle: 'For selling',
            image: 'assets/gosell.png',
          ),
          CatagoriesListBuild(
            onClicked: () {
              Get.to(const CompareScreen());
            },
            title: 'Comparision',
            subtitle: 'With CarDekhlo',
            image: 'assets/gocom.png',
          ),
          CatagoriesListBuild(
            onClicked: () {
              Get.to(const ViewAdPage());
            },
            title: 'View Ads',
            subtitle: 'posted ',
            image: 'assets/ads.png',
          ),
          CatagoriesListBuild(
            onClicked: () {
              Get.to(const Spare());
            },
            title: 'Spare Parts',
            subtitle: 'with CarDekhlo',
            image: 'assets/sparecars.png',
          ),
          CatagoriesListBuild(
            onClicked: () {
              Get.to(const AuctionData());
            },
            title: 'Auction Sheet',
            subtitle: 'Apply verification',
            image: 'assets/auc.png',
          ),
          GestureDetector(
            onTap: () {
              logoutUser(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 18, right: 20, top: 5),
              padding: const EdgeInsets.all(13),
              height: 82,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: bulao2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log Out',
                    style: blackTektFont1.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class CatagoriesListBuild extends StatelessWidget {
  final VoidCallback onClicked;
  final String title;
  final String subtitle;
  final String image;
  const CatagoriesListBuild({
    Key? key,
    required this.onClicked,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.only(left: 18, right: 20, top: 5),
        padding: const EdgeInsets.all(13),
        height: 82,
        width: MediaQuery.of(context).size.width - 60,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: bulao2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: blackTektFont1.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  subtitle,
                  style: blackTektFont1.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ],
            ),
            Image.asset(image)
          ],
        ),
      ),
    );
  }
}
