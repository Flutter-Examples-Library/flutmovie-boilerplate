import 'package:covid19_app/pages/HookWidgetBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppLogoImage extends HookWidgetBase {
  final double width;
  final double height;
  final bool inAnimated;
  AppLogoImage({this.width = 200, this.height = 200, this.inAnimated = true});

  @override
  Widget build(BuildContext context) {
    var animationController =
        useAnimationController(duration: Duration(seconds: 10));
    animationController.repeat();
    return TweenAnimationBuilder<double>(
      tween: _tween,
      duration: Duration(milliseconds: 500),
      curve: Curves.bounceOut,
      builder: (_, scale, child) {
        return Transform.translate(
          offset: Offset(0, -100 * scale),
          child: child,
        );
      },
      child: Image.asset(
        "assets/images/logo.png",
        height: this.height,
        width: this.width,
        fit: BoxFit.contain,
      ),
    );
  }

  Tween<double> get _tween {
    return this.inAnimated
        ? Tween<double>(begin: -1.0, end: 0)
        : Tween<double>(begin: 0, end: 0);
  }
}
