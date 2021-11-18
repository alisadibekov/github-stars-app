import 'package:flutter/material.dart';

class DistanceGuide {
  final BuildContext context;

  static double kMediaQueryHeight = 0.0;
  static double kMediaQueryHeightWithoutNavbar = 0.0;

  static const double kWidthFactor = 0.90;

  DistanceGuide({required this.context});

  getKMediaQueryHeightWithoutNavbar() {
    return MediaQuery.of(context).size.height - 144.0;
  }
}
