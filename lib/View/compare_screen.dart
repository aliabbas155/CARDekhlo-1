// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';

import 'package:car_dekh_lo/Components/constants.dart';
import 'package:car_dekh_lo/Model/car_model.dart';
import 'package:car_dekh_lo/config/constants.dart';
import 'package:car_dekh_lo/widgets/compare/compare_column.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({Key? key}) : super(key: key);

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Center(child: Text("Compare Cars")),
        // foregroundColor: Colors.white,
        backgroundColor: Colors.white54,
        elevation: 4,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: StreamBuilder(
        stream: carController.getCarStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white54,
              ),
            );
          }

          if (snapshot.hasData) {
            List<CarModel> data;
            try {
              data = snapshot.data!.docs.map(
                (e) {
                  // log.d(e.data());
                  return CarModel.fromSnapshot(e);
                },
              ).toList();
            } catch (e) {
              data = [];
              log.e(e);
            }
            var size = MediaQuery.of(context).size;
            var width = size.width;
            var height = size.height;

            var aspectRatio = (width / 2) / (height / 1);

            return Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.black],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                  ),
                ),
                SafeArea(
                  child: GridView.count(
                      primary: true,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: aspectRatio,
                      crossAxisCount: 2,
                      children: <Widget>[
                        CompareColumn(
                          data: data,
                        ),
                        CompareColumn(
                          data: data.reversed.toList(),
                        ),
                      ]),
                ),
              ],
            );
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white54,
          ));
        },
      ),
    );
  }
}
