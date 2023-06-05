// Flutter imports:
import 'dart:io';

import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';

class CarImageWidget extends StatelessWidget {
  final VoidCallback onClicked;
  List<File>? imageUrls = [];

  CarImageWidget({
    Key? key,
    required this.onClicked,
    this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: onClicked,
            child: buildCarImage(),
          )
        ],
      ),
    );
  }

  Widget buildCarImage() {
    var kWidth = Get.size.width;
    var kHeight = Get.size.height;
    return Container(
      width: kWidth * 0.9,
      height: kHeight * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
      ),
      child: imageUrls!.isNotEmpty
          ? GridView.count(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              children: imageUrls!
                  .map((e) => Image.file(
                        File(e.path),
                        fit: BoxFit.cover,
                      ))
                  .toList(),
            )
          : FittedBox(
              fit: BoxFit.fitHeight,
              child: Image.asset('assets/addimg.png'),
            ),
    );
  }
}
