import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:galleryimage/galleryimage.dart';

import '../Model/ad_data.dart';
import '../services/auth.dart';
import '../services/database.dart';

class ViewAdPage extends StatefulWidget {
  const ViewAdPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewAdPage> createState() => _ViewAdPageState();
}

class _ViewAdPageState extends State<ViewAdPage> {
  final User? user = Auth().currentUser;

  Widget _title() {
    return const Center(child: Text('All Ads '));
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUid(),
            Expanded(
              flex: 7,
              child: StreamBuilder<List<AdData>>(
                stream: readAdData(),
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    snapshot.data;
                    snapshot.error;
                    return const Text('Something went wrong!');
                  } else if (snapshot.hasData) {
                    final ad = snapshot.data;
                    return ListView(
                      children: ad!.map(buildCarAd).toList(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCarAd(AdData adData) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 5,
        color: Colors.blue[50],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              GalleryImage(imageUrls: adData.carImages),
              ExpansionTile(
                childrenPadding: const EdgeInsets.all(10),
                tilePadding: const EdgeInsets.all(10),
                title: Text(
                  adData.adTitle,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    adData.carLocation,
                  ),
                ),
                trailing: Text(
                  'Rs: ${adData.carPrice}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Table(
                    children: [
                      buildRow('Company', adData.carCompany),
                      buildRow('Modal', adData.carModel),
                      buildRow('Variant', adData.carVariant),
                      buildRow('Registered In', adData.carRegistration),
                      buildRow('Milage (km)', adData.carMilage),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                    child: Text(
                      adData.carDescription,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

TableRow buildRow(String main, String sub) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Text(
          main,
          style: TextStyle(fontSize: 0.02.sh, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          sub,
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.blue, fontSize: 0.02.sh),
        ),
      ),
    ],
  );
}
