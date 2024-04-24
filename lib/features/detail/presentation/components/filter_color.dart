import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';

class FilterColor extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onClick;

  const FilterColor({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: myBorderRadius,
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? context.scheme.primary : context.scheme.surface,
          ),
          color: context.scheme.surface,
          borderRadius: myBorderRadius,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
