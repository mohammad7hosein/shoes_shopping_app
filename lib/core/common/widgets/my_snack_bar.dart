import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';

SnackBar mySnackBar(String message) {
  return SnackBar(
    content: Center(child: Text(message)),
    margin: EdgeInsets.fromLTRB(
      20,
      0,
      20,
      SizeConfig.screenHeight - 300,
    ),
    padding: const EdgeInsets.all(20),
    duration: const Duration(milliseconds: 1500),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: myBorderRadius,
    ),
  );
}
