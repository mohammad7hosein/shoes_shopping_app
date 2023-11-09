import 'package:flutter/material.dart';

import 'brand_type.dart';
import 'shoe.dart';

class Cart {
  final int id;
  final String title;
  final String subTitle;
  final double price;
  final String imageSrc;
  final BrandType brandType;
  final String size;
  final Color color;
  int quantity;

  factory Cart.fromShoe({
    required Shoe shoe,
    required String size,
    required Color color,
    required int quantity,
  }) {
    return Cart(
      id: shoe.id,
      title: shoe.title,
      subTitle: shoe.subTitle,
      price: shoe.price,
      imageSrc: shoe.imageSrc,
      brandType: shoe.brandType,
      size: size,
      color: color,
      quantity: quantity,
    );
  }

  Cart({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.imageSrc,
    required this.brandType,
    required this.size,
    required this.color,
    required this.quantity,
  });
}

final List<Cart> itemCarts = [];
