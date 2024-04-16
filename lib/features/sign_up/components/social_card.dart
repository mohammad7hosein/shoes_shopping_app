import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class SocialCard extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const SocialCard({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(12),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: myBorderRadius,
          color: light,
        ),
        child: myIcon(icon, blendMode: BlendMode.dstIn),
      ),
    );
  }

  static Widget buildSocialCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(
          icon: Assets.iconsGoogle,
          onPressed: () {},
        ),
        SocialCard(
          icon: Assets.iconsFacebook,
          onPressed: () {},
        ),
        SocialCard(
          icon: Assets.iconsTwitter,
          onPressed: () {},
        ),
      ],
    );
  }
}