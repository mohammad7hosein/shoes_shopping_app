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
              child: Image.asset(cart.imageSrc),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.title,
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                      Text(
                        cart.subTitle,
                        style:
                            textTheme.bodySmall?.copyWith(color: MyTheme.gray),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(cart.size),
                  const SizedBox(width: 10),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: cart.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$${cart.price.toInt()}',
                    style:
                        textTheme.bodyMedium?.copyWith(color: MyTheme.primary),
                    maxLines: 2,
                  ),
                  const Spacer(),
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
          ),
        )
      ],
    );
  }
}
