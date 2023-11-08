import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/models/cart.dart';
import '../../widgets/my_app_bar.dart';
import 'components/cart_item.dart';
import 'components/checkout_card.dart';

class CartScreen extends StatefulWidget {
  static String route = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MyAppBar(
        title: Column(
          children: [
            const Text("Your Cart"),
            Text(
              "${itemCarts.length} items",
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: itemCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(itemCarts[index].id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  itemCarts.removeAt(index);
                });
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Iconsax.trash,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              child: CartItem(
                cart: itemCarts[index],
                onAddQuantity: () {
                  setState(() => itemCarts[index].quantity++);
                },
                onMinusQuantity: () {
                  setState(() => itemCarts[index].quantity--);
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
