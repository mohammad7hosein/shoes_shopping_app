import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_shopping_app/core/common/widgets/loading/loading_screen.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/home/presentation/home_screen.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/cart_event.dart';
import 'bloc/cart_state.dart';
import 'components/cart_item.dart';
import 'components/checkout_card.dart';

class CartScreen extends StatelessWidget {
  static String route = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(CartStarted());
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == CartStatus.loading) {
          return LoadingScreen.instance()
              .show(context: context, text: 'Loading...');
        } else {
          return LoadingScreen.instance().hide();
        }
      },
      builder: (context, state) {
        final cartItems = state.cartItems;
        return Scaffold(
          appBar: MyAppBar(
            title: Column(
              children: [
                const Text("Your Cart"),
                Text(
                  "${cartItems.length} items",
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(item.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      context.read<CartBloc>().add(
                            CartItemRemoved(
                              id: item.id,
                              size: item.size,
                              color: item.color,
                            ),
                          );
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),
                        borderRadius: myBorderRadius,
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          myIcon(context, 
                            Assets.iconsTrash,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    child: CartItem(
                      cart: item,
                      onAddQuantity: () {
                        context.read<CartBloc>().add(
                              CartItemQuantityChanged(
                                id: item.id,
                                size: item.size,
                                color: item.color,
                                quantity: item.quantity + 1,
                              ),
                            );
                      },
                      onMinusQuantity: () {
                        context.read<CartBloc>().add(
                              CartItemQuantityChanged(
                                id: item.id,
                                size: item.size,
                                color: item.color,
                                quantity: item.quantity - 1,
                              ),
                            );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: CheckoutCard(
            totalPrice: state.totalPrice,
            onCheckout: () {
              context.read<CartBloc>().add(CartCheckout());
              Navigator.pushNamed(context, HomeScreen.route);
            },
          ),
        );
      },
    );
  }
}
