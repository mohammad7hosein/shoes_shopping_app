import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Iconsax.arrow_left_2,
        ),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 54);
}
