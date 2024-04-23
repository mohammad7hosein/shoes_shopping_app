import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';

class CheckoutCard extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onCheckout;

  const CheckoutCard({
    Key? key,
    required this.totalPrice,
    required this.onCheckout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: context.scheme.surface,
        boxShadow: [myBoxShadow(context)],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.scheme.background,
                borderRadius: myBorderRadius,
              ),
              child: TextField(
                style: context.textTheme.bodySmall,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'discount code',
                  suffixIcon: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.scheme.secondary,
                      padding: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: myBorderRadius,
                      ),
                    ),
                    child: Text(
                      'Apply',
                      style: context.textTheme.labelLarge
                          ?.copyWith(color: context.scheme.onSecondary),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: context.theme.hintColor),
                    children: [
                      TextSpan(
                        text: "\$$totalPrice",
                        style: context.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: onCheckout,
                    child: Text(
                      'Check Out',
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
