import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class ProfileMenu extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onClick;

  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(20),
          backgroundColor: context.scheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: myBorderRadius,
          ),
        ),
        onPressed: onClick,
        child: Row(
          children: [
            myIcon(
              context,
              icon,
              color: context.scheme.primary,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: context.textTheme.bodySmall,
              ),
            ),
            myIcon(context, Assets.iconsArrowRight),
          ],
        ),
      ),
    );
  }
}
