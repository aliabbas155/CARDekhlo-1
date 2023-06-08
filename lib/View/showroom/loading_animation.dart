import 'package:car_dekh_lo/View/showroom/ripple_animater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/app_colors.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key? key,
    this.widget,
  }) : super(key: key);
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RippleAnimater(
            rippleColor: AppColors.primaryColor,
            widget: SizedBox(
              height: 0.4.sh,
              child: widget ??
                  Image.asset(
                    'assets/auction.jpeg',
                    fit: BoxFit.contain,
                    width: 0.3.sw,
                    height: 0.3.sw,
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
            )));
  }
}
