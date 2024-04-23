import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/data/model/cart.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

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
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.scheme.surface,
                borderRadius: myBorderRadius,
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
                        style: context.textTheme.bodyMedium,
                        maxLines: 1,
                      ),
                      Text(
                        cart.subTitle,
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: context.theme.hintColor),
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
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$${cart.price.toInt()}',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: context.scheme.primary),
                    maxLines: 2,
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: context.scheme.surface,
                      borderRadius: myBorderRadius,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          splashRadius: 1,
                          onPressed: onMinusQuantity,
                          icon: myIcon(context, Assets.iconsMinus),
                        ),
                        Text(
                          "${cart.quantity}",
                          style: context.textTheme.bodyMedium,
                        ),
                        IconButton(
                          splashRadius: 1,
                          onPressed: onAddQuantity,
                          icon: myIcon(context, Assets.iconsAdd),
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
