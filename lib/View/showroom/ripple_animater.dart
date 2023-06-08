import 'package:car_dekh_lo/View/showroom/ripple_painter.dart';
import 'package:flutter/material.dart';



class RippleAnimater extends StatefulWidget {
  const RippleAnimater({
    Key? key,
    required this.widget,
    this.duration,
    this.rippleColor,
  }) : super(key: key);
  final Widget widget;
  final Duration? duration;
  final Color? rippleColor;

  @override
  State<RippleAnimater> createState() => _RippleAnimaterState();
}

class _RippleAnimaterState extends State<RippleAnimater>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        } else if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      
      painter: RipplePainter(
          animationValue: _animation.value, color: widget.rippleColor),
      child: widget.widget,
    );
  }
}
