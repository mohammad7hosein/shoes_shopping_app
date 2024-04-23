import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';

class SplashContent extends StatelessWidget {
  final String text, image;

  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "Seyed Shoe",
          style: context.textTheme.titleLarge
              ?.copyWith(color: context.scheme.primary),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: 250,
          width: 250,
        )
      ],
    );
  }
}
