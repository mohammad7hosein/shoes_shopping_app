import 'dart:ui';

sealed class CartEvent {}

final class CartStarted extends CartEvent {}

final class CartItemQuantityChanged extends CartEvent {
  final int id;
  final String size;
  final Color color;
  final int quantity;

  CartItemQuantityChanged({
    required this.id,
    required this.size,
    required this.color,
    required this.quantity,
  });
}

final class CartItemRemoved extends CartEvent {
  final int id;
  final String size;
  final Color color;

  CartItemRemoved({
    required this.id,
    required this.size,
    required this.color,
  });
}

final class CartCheckout extends CartEvent {}
