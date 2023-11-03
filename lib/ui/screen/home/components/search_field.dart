import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/util/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          myBoxShadow(),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          // search value
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(Iconsax.search_normal_1),
          hintText: "Search...",
          hintStyle: TextStyle(
            fontSize: 16,
            color: MyTheme.gray,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
