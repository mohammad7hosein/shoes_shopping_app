import 'package:shoes_shopping_app/data/models/cart.dart';

enum CartStatus { initial, loading , success, failure }

final class CartState {
  final CartStatus status;
  final List<Cart> cartItems;
  final double totalPrice;

  const CartState({
    this.status = CartStatus.initial,
    this.cartItems = const [],
    this.totalPrice = 0.0,
  });

  CartState copyWith({
    CartStatus? status,
    List<Cart>? cartItems,
    double? totalPrice,
  }) {
    return CartState(
      status: status ?? this.status,
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}