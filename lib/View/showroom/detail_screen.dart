import 'package:car_dekh_lo/Model/showroom_model.dart';
import 'package:car_dekh_lo/config/app_colors.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.showroom}) : super(key: key);
  final ShowRoomModel showroom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackColor,
      appBar: AppBar(
        title: Text(showroom.name),
      ),
      body: ListView(
        children: [
          Text("Name : ${showroom.name}"),
          Text("Description : ${showroom.description}"),
          Text(
              "Address : ${showroom.address.latitude}  ${showroom.address.longitude}"),
          Text("Rating : ${showroom.rating}"),
        ],
      ),
    );
  }
}
