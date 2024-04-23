import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  const MyAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: myIcon(context, Assets.iconsArrowLeft),
      ),
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 54);
}
