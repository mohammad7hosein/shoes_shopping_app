import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class SearchField extends StatelessWidget {
  final Function(String query) onSearch;

  const SearchField({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: myBorderRadius,
        boxShadow: [myBoxShadow],
      ),
      child: TextField(
        onChanged: (value) {},
        onSubmitted: (value) => onSearch(value),
        style: Theme.of(context).textTheme.bodyMedium,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          icon: myIcon(Assets.iconsSearch),
          hintText: "Search...",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
