import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/core/data/model/shoe.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';

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
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
                  child: Icon(
                    isLiked ? Iconsax.heart5 : Iconsax.heart,
                    color: isLiked ? Colors.red : Colors.grey,
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
              style: textTheme.bodySmall,
            ),
            Text(
              shoe.subTitle,
              style: textTheme.bodySmall?.copyWith(color: MyTheme.gray),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${shoe.price.toInt()}',
              style: textTheme.bodyMedium?.copyWith(color: MyTheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
