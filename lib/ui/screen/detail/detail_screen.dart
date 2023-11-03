import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/models/shoe.dart';
import 'package:shoes_shopping_app/ui/screen/detail/components/filter_color.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/filter_item.dart';
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
  String? selectedSize;
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        decoration: const BoxDecoration(color: MyTheme.secondaryLight),
        child: Column(
          children: [
            buildImage(),
            buildDetails(textTheme),
          ],
        ),
      ),
    );
  }

  buildDetails(TextTheme textTheme) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
            boxShadow: [
              myBoxShadow(),
            ]),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitleAndSubTitle(textTheme),
                const SizedBox(height: 24),
                buildSizes(textTheme),
                const SizedBox(height: 24),
                buildColors(textTheme),
                const SizedBox(height: 60),
                buildAddToCartButton(textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildImage() {
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

  buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MyTheme.secondaryLight,
      actions: [
        IconButton(
          onPressed: () {
            // set favorite
          },
          icon: const Icon(Iconsax.heart),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Iconsax.arrow_left_2),
      ),
    );
  }

  buildAddToCartButton(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text.rich(
            TextSpan(
              text: "Price:\n",
              style: textTheme.bodySmall?.copyWith(color: MyTheme.gray),
              children: [
                TextSpan(
                  text: widget.shoe.price,
                  style: textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Iconsax.shopping_cart),
                SizedBox(width: 16),
                Text("Add to cart"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildColors(TextTheme textTheme) {
    final colors = widget.shoe.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: textTheme.titleSmall?.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              final item = colors[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilterColor(
                  color: item,
                  isSelected: selectedColor == item,
                  onClick: () {
                    setState(() => selectedColor = item);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  buildSizes(TextTheme textTheme) {
    final sizes = widget.shoe.sizes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: textTheme.titleSmall?.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            itemBuilder: (context, index) {
              final item = sizes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FilterItem(
                  text: item,
                  isSelected: selectedSize == item,
                  onClick: () {
                    setState(() => selectedSize = item);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  buildTitleAndSubTitle(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.shoe.title,
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 6),
        Text(
          widget.shoe.subTitle,
          style: textTheme.titleSmall?.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
