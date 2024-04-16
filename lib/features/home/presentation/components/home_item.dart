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
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: myBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onLike,
                  child: myIcon(
                    isLiked ? Assets.iconsHeartFill : Assets.iconsHeart,
                    color: isLiked ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Hero(
                tag: shoe.imageSrc,
                child: Image.asset(shoe.imageSrc),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              shoe.title,
              style: context.textTheme.bodySmall,
            ),
            Text(
              shoe.subTitle,
              style: context.textTheme.bodySmall?.copyWith(color: gray),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${shoe.price.toInt()}',
              style: context.textTheme.bodyMedium?.copyWith(color: primary),
            ),
          ],
        ),
      ),
    );
  }
}
