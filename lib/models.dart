import 'package:flutter/material.dart';

enum Brand { adidas, nike, puma }

class Shoe {
  final int id;
  final String title;
  final String subTitle;
  final String price;
  final String imageSrc;
  final Brand brand;
  bool isFavorite;
  final List<String> sizes;
  final List<Color> colors;

   Shoe({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.imageSrc,
    required this.brand,
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
    imageSrc: 'assets/image/image7.png',
    price: '\$250',
    brand: Brand.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 2,
    title: 'Adidas',
    subTitle: 'Human Race',
    imageSrc: 'assets/image/image1.png',
    price: '\$280',
    brand: Brand.adidas,
    sizes: ['39', '40', '41', '42', '43'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 3,
    title: 'Puma',
    subTitle: 'Zoom Pegasus',
    imageSrc: 'assets/image/image3.png',
    price: '\$250',
    brand: Brand.puma,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 4,
    title: 'Nike',
    subTitle: 'Joyraide',
    imageSrc: 'assets/image/image2.png',
    price: '\$320',
    brand: Brand.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 5,
    title: 'Nike',
    subTitle: 'Beautiful Old Design',
    imageSrc: 'assets/image/image8.png',
    price: '\$160',
    brand: Brand.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 6,
    title: 'Nike',
    subTitle: 'Joyraide',
    imageSrc: 'assets/image/image6.png',
    price: '\$320',
    brand: Brand.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 7,
    title: 'Puma',
    subTitle: 'Street Ball',
    imageSrc: 'assets/image/image4.png',
    price: '\$160',
    brand: Brand.puma,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 8,
    title: 'Nike',
    subTitle: 'Zoom Pegasus',
    imageSrc: 'assets/image/image11.png',
    price: '\$250',
    brand: Brand.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 9,
    title: 'Adidas',
    subTitle: 'Human Race',
    imageSrc: 'assets/image/image9.png',
    price: '\$280',
    brand: Brand.adidas,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 10,
    title: 'Nike',
    subTitle: 'Joyraide',
    imageSrc: 'assets/image/image10.png',
    price: '\$320',
    brand: Brand.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 11,
    title: 'Puma',
    subTitle: 'Street Ball',
    imageSrc: 'assets/image/image12.png',
    price: '\$160',
    brand: Brand.puma,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
  Shoe(
    id: 12,
    title: 'Nike',
    subTitle: 'Running Shoe',
    imageSrc: 'assets/image/image13.png',
    price: '\$280',
    brand: Brand.nike,
    sizes: ['36', '37', '38', '39', '40'],
    colors: [Colors.red, Colors.blue, Colors.green],
  ),
];
