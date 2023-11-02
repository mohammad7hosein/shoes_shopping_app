import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/models.dart';
import 'package:shoes_shopping_app/util/theme.dart';

import '../../detail/detail_screen.dart';

class Item extends StatefulWidget {
  final Shoe shoe;

  const Item({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailScreen(widget.shoe)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Icon(
                    isLiked ? Iconsax.heart5 : Iconsax.heart,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Hero(
                tag: widget.shoe.imageSrc,
                child: Image.asset(
                  widget.shoe.imageSrc,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.shoe.title,
              style: textTheme.bodySmall?.copyWith(color: MyTheme.darkGray),
            ),
            Text(
              widget.shoe.subTitle,
              style: textTheme.bodySmall?.copyWith(color: MyTheme.gray),
            ),
            const SizedBox(height: 10),
            Text(
              widget.shoe.price,
              style: textTheme.bodyMedium?.copyWith(color: MyTheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
