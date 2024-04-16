import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';

class CustomSuffixIcon extends StatelessWidget {
  final String icon;

  const CustomSuffixIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        20,
        20,
        20,
      ),
      child: myIcon(icon, color: darkGray),
    );
  }
}
