import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/filter_button.dart';
import 'package:shoes_shopping_app/ui/screen/detail/components/filter_color.dart';
import 'package:shoes_shopping_app/models.dart';
import 'package:shoes_shopping_app/util/theme.dart';

class DetailScreen extends StatefulWidget {
  static const route = '/detail';
  final Shoe shoe;

  const DetailScreen(this.shoe, {Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        decoration: const BoxDecoration(color: MyTheme.secondary),
        child: Column(
          children: [
            buildImage(),
            buildDetails(context),
          ],
        ),
      ),
    );
  }

  Expanded buildDetails(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: const BoxDecoration(
          color: MyTheme.light,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(42),
            topLeft: Radius.circular(42),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleAndSubTitle(),
                const SizedBox(height: 24),
                buildSizes(),
                const SizedBox(height: 24),
                buildColors(),
                const SizedBox(height: 42),
                buildAddToCartButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildImage() {
    return Expanded(
      flex: 2,
      child: Hero(
        tag: widget.shoe.imageSrc,
        child: Image(
          image: AssetImage(widget.shoe.imageSrc),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: MyTheme.secondary,
      ),
      elevation: 0.0,
      backgroundColor: MyTheme.secondary,
      actions: const [
        Icon(
          Icons.favorite_border_rounded,
          color: MyTheme.light,
        ),
        Padding(padding: EdgeInsets.all(8)),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: MyTheme.light,
        ),
      ),
    );
  }

  Widget buildAddToCartButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(24),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: MyTheme.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.shoe.price,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.shopping_cart),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    "Add to cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildColors() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            FilterColor(Colors.red),
            SizedBox(width: 20),
            FilterColor(Colors.green),
            SizedBox(width: 20),
            FilterColor(Colors.blue),
            SizedBox(width: 20),
          ],
        ),
      ],
    );
  }

  Column buildSizes() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterButton('US6', null, true),
              SizedBox(width: 10),
              FilterButton('US7', null, true),
              SizedBox(width: 10),
              FilterButton('US8', null, true),
              SizedBox(width: 10),
              FilterButton('US9', null, true),
              SizedBox(width: 10),
              FilterButton('US10', null, true),
              SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }

  Column buildTitleAndSubTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.shoe.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          widget.shoe.subTitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
