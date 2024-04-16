import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

import 'brand_type.dart';

class Shoe {
  final int id;
  final String title;
  final String subTitle;
  final double price;
  final String imageSrc;
  final BrandType brandType;
  bool isFavorite;
  final List<String> sizes;
  final List<Color> colors;

  Shoe({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.imageSrc,
    required this.brandType,
    required this.sizes,
    required this.colors,
    this.isFavorite = false,
  });
}

final List<Shoe> shoes = [
  Shoe(
    id: 1,
    title: 'Nike',
    subTitle: 'Red Jordan',
    imageSrc: Assets.imagesImage7,
    price: 250,
    brandType: BrandType.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 2,
    title: 'Adidas',
    subTitle: 'Human Race',
    imageSrc: Assets.imagesImage1,
    price: 280,
    brandType: BrandType.adidas,
    sizes: ['39', '40', '41', '42', '43'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 3,
    title: 'Puma',
    subTitle: 'Zoom Pegasus',
    imageSrc: Assets.imagesImage3,
    price: 250,
    brandType: BrandType.puma,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 4,
    title: 'Nike',
    subTitle: 'Joyraide',
    imageSrc: Assets.imagesImage2,
    price: 320,
    brandType: BrandType.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 5,
    title: 'Nike',
    subTitle: 'Beautiful Old Design',
    imageSrc: Assets.imagesImage8,
    price: 160,
    brandType: BrandType.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 6,
    title: 'Nike',
    subTitle: 'Joyraide',
    imageSrc: Assets.imagesImage6,
    price: 320,
    brandType: BrandType.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 7,
    title: 'Puma',
    subTitle: 'Street Ball',
    imageSrc: Assets.imagesImage4,
    price: 160,
    brandType: BrandType.puma,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 8,
    title: 'Nike',
    subTitle: 'Zoom Pegasus',
    imageSrc: Assets.imagesImage11,
    price: 250,
    brandType: BrandType.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 9,
    title: 'Adidas',
    subTitle: 'Human Race',
    imageSrc: Assets.imagesImage9,
    price: 280,
    brandType: BrandType.adidas,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 10,
    title: 'Nike',
    subTitle: 'Joyraide',
    imageSrc: Assets.imagesImage10,
    price: 320,
    brandType: BrandType.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 11,
    title: 'Puma',
    subTitle: 'Street Ball',
    imageSrc: Assets.imagesImage12,
    price: 160,
    brandType: BrandType.puma,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 12,
    title: 'Nike',
    subTitle: 'Running Shoe',
    imageSrc: Assets.imagesImage13,
    price: 280,
    brandType: BrandType.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
];
