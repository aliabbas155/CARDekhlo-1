import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auctionentry.dart';

class AuctionData extends StatefulWidget {
  const AuctionData({Key? key}) : super(key: key);
  @override
  State<AuctionData> createState() => _AuctionDataState();
}

class _AuctionDataState extends State<AuctionData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text('Verification')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             const Image(
             width: 400,
             height: 400,
              image: AssetImage('assets/auction.jpeg'),
             ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Register Your Car ASAP With Us In 2023',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Get.to(const InsertData());
              },
              color: Colors.red,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
              child: const Text('Apply Now'),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
