import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';

class FilterItem extends StatelessWidget {
  final String? icon;
  final String? text;
  final bool isSelected;
  final VoidCallback onClick;

  const FilterItem({
    Key? key,
    this.icon,
    this.text,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: myBorderRadius,
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? context.scheme.primary : context.scheme.surface,
          borderRadius: myBorderRadius,
        ),
        child: text != null
            ? Text(
                text!,
                style: context.textTheme.bodySmall?.copyWith(
                  color: isSelected
                      ? context.scheme.onPrimary
                      : context.scheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
              )
            : myIcon(context, icon ?? ''),
      ),
    );
  }
}
