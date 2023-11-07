import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/util/theme.dart';

import '../../../data/models/cart.dart';

class CartItem extends StatelessWidget {
  final Cart cart;
  final VoidCallback onAddQuantity;
  final VoidCallback onMinusQuantity;

  const CartItem({
    Key? key,
    required this.cart,
    required this.onAddQuantity,
    required this.onMinusQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MyTheme.light,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(cart.shoe.imageSrc),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.shoe.title,
              style: textTheme.bodyMedium,
              maxLines: 1,
            ),
            // const SizedBox(height: 5),
            Text(
              cart.shoe.subTitle,
              style: textTheme.bodySmall?.copyWith(color: MyTheme.gray),
              maxLines: 2,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  cart.shoe.price,
                  style: textTheme.bodyMedium?.copyWith(color: MyTheme.primary),
                  maxLines: 2,
                ),
                const SizedBox(width: 80),
                Container(
                  decoration: BoxDecoration(
                    color: MyTheme.light,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        splashRadius: 1,
                        onPressed: onMinusQuantity,
                        icon: const Icon(Iconsax.minus),
                      ),
                      Text(
                        "${cart.quantity}",
                        style: textTheme.bodyMedium,
                      ),
                      IconButton(
                        splashRadius: 1,
                        onPressed: onAddQuantity,
                        icon: const Icon(Iconsax.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
