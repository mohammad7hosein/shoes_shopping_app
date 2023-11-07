import 'package:flutter/material.dart';

import 'brand_type.dart';
import 'shoe.dart';

class Cart {
  final Shoe shoe;
  int quantity;

  Cart({
    required this.shoe,
    this.quantity = 0,
  });
}

final List<Cart> itemCarts = [
  Cart(
    shoe: Shoe(
      id: 1,
      title: 'Nike',
      subTitle: 'Red Jordan',
      imageSrc: 'assets/image/image7.png',
      price: '\$250',
      brandType: BrandType.nike,
      sizes: ['36', '37', '38', '39', '40'],
      colors: [Colors.red, Colors.blue, Colors.green],
    ),
  ),
  Cart(
    shoe: Shoe(
      id: 2,
      title: 'Adidas',
      subTitle: 'Human Race',
      imageSrc: 'assets/image/image1.png',
      price: '\$280',
      brandType: BrandType.adidas,
      sizes: ['39', '40', '41', '42', '43'],
      colors: [Colors.red, Colors.blue, Colors.green],
    ),
  ),
  Cart(
    shoe: Shoe(
      id: 3,
      title: 'Puma',
      subTitle: 'Zoom Pegasus',
      imageSrc: 'assets/image/image3.png',
      price: '\$250',
      brandType: BrandType.puma,
      sizes: ['36', '37', '38', '39', '40'],
      colors: [Colors.red, Colors.blue, Colors.green],
    ),
  ),
];
