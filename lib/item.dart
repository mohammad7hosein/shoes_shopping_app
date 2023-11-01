import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/models.dart';
import 'package:shoes_shopping_app/util/theme.dart';

import 'screen/detail_screen.dart';

class Item extends StatefulWidget {
  final Shoe shoe;

  const Item(this.shoe, {Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailScreen(widget.shoe)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
                IconButton(
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(
                    isLiked
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_rounded,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                ),
                const Icon(
                  Icons.add,
                  color: MyTheme.primary,
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
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.shoe.title,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.shoe.subTitle,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.shoe.price,
                style: const TextStyle(
                  color: MyTheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
