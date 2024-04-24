import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: context.scheme.surface,
        borderRadius: myBorderRadius,
      ),
      child: TextField(
        onChanged: (value) {},
        onSubmitted: (value) => onSearch(value),
        style: context.textTheme.bodyMedium,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          icon: myIcon(context, Assets.iconsSearch),
          hintText: "Search...",
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
