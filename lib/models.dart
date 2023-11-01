enum Brand { adidas, nike, puma }

class Shoe {
  final String title;
  final String subTitle;
  final String price;
  final String imageSrc;
  final Brand brand;
  final bool isFavorite;

  const Shoe({
    required this.title,
    required this.subTitle,
    required this.price,
    required this.imageSrc,
    required this.brand,
    this.isFavorite = false,
  });
}

const List<Shoe> shoes = [
  Shoe(
    title: 'Nike',
    subTitle: 'Red Jordan',
    imageSrc: 'assets/image/image7.png',
    price: '\$250',
    brand: Brand.nike,
  ),
  Shoe(
    title: 'Adidas',
    subTitle: 'Human Race',
    imageSrc: 'assets/image/image1.png',
    price: '\$280',
    brand: Brand.adidas,
  ),
  Shoe(
    title: 'Puma',
    subTitle: 'Zoom Pegasus',
    imageSrc: 'assets/image/image3.png',
    price: '\$250',
    brand: Brand.puma,
  ),
  Shoe(
    title: 'Nike',
    subTitle: 'Joyraide',
    imageSrc: 'assets/image/image2.png',
    price: '\$320',
    brand: Brand.nike,
  ),
  Shoe(
    title: 'Nike',
    subTitle: 'Beautiful Old Design',
    imageSrc: 'assets/image/image8.png',
    price: '\$160',
    brand: Brand.nike,
  ),
  Shoe(
    title: 'Nike',
    subTitle: 'Joyraide',
    imageSrc: 'assets/image/image6.png',
    price: '\$320',
    brand: Brand.nike,
  ),
  Shoe(
    title: 'Puma',
    subTitle: 'Street Ball',
    imageSrc: 'assets/image/image4.png',
    price: '\$160',
    brand: Brand.puma,
  ),
  Shoe(
    title: 'Nike',
    subTitle: 'Zoom Pegasus',
    imageSrc: 'assets/image/image11.png',
    price: '\$250',
    brand: Brand.nike,
  ),
  Shoe(
    title: 'Adidas',
    subTitle: 'Human Race',
    imageSrc: 'assets/image/image9.png',
    price: '\$280',
    brand: Brand.adidas,
  ),
  Shoe(
    title: 'Nike',
    subTitle: 'Joyraide',
    imageSrc: 'assets/image/image10.png',
    price: '\$320',
    brand: Brand.nike,
  ),
  Shoe(
    title: 'Puma',
    subTitle: 'Street Ball',
    imageSrc: 'assets/image/image12.png',
    price: '\$160',
    brand: Brand.puma,
  ),
  Shoe(
    title: 'Nike',
    subTitle: 'Running Shoe',
    imageSrc: 'assets/image/image13.png',
    price: '\$280',
    brand: Brand.nike,
  ),
];
