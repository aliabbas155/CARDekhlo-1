import 'dart:math';

import 'package:flutter/material.dart';

class RipplePainter extends CustomPainter {
  final double animationValue;
  final Color? color;
  RipplePainter({
    required this.animationValue,
    this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int value = 3; value >= 0; value--) {
      circle(canvas, Rect.fromLTRB(0, 0, size.width, size.height),
          value + animationValue);
    }
  }

  void circle(Canvas canvas, Rect rect, double value) {
    Paint paint = Paint()
      ..color = color == null
          ? const Color(0xff2192FF).withOpacity((1 - (value / 4)).clamp(.0, 1))
          : color!.withOpacity((1 - (value / 4)).clamp(.0, 1));

    canvas.drawCircle(rect.center,
        sqrt((rect.width * .5 * rect.width * .5) * value / 4), paint);
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) {
    return true;
  }
}
