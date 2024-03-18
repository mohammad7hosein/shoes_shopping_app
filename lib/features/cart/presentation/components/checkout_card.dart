import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';

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
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          myBoxShadow(),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MyTheme.light,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                style: textTheme.bodySmall,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'discount code',
                  suffixIcon: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.all(5),
                        textStyle: textTheme.labelLarge,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text('Apply'),
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
                    style: textTheme.bodySmall?.copyWith(color: MyTheme.gray),
                    children: [
                      TextSpan(
                        text: "\$$totalPrice",
                        style: textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: onCheckout,
                    child: const Text('Check Out'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
