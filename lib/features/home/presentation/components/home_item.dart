import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/data/model/shoe.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class HomeItem extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback onClick;
  final VoidCallback onLike;
  final bool isLiked;

  const HomeItem({
    Key? key,
    required this.shoe,
    required this.onClick,
    required this.onLike,
    required this.isLiked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: myBorderRadius,
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.scheme.surface,
          borderRadius: myBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: onLike,
                  child: myIcon(
                    context,
                    isLiked ? Assets.iconsHeartFill : Assets.iconsHeart,
                    color: isLiked ? Colors.red : null,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Hero(
                tag: shoe.imageSrc,
                child: Image.asset(shoe.imageSrc),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              shoe.title,
              style: context.textTheme.bodySmall,
            ),
            Text(
              shoe.subTitle,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: context.theme.hintColor),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${shoe.price.toInt()}',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.scheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
