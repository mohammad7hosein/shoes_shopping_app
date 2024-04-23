import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

final verySmallSpace = SizeConfig.screenHeight * 0.01;
final smallSpace = SizeConfig.screenHeight * 0.025;
final mediumSpace = SizeConfig.screenHeight * 0.04;
final largeSpace = SizeConfig.screenHeight * 0.08;
final veryLargeSpace = SizeConfig.screenHeight * 0.16;
