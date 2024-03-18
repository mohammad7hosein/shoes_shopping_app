import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';

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
      borderRadius: BorderRadius.circular(16),
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? MyTheme.primary : Colors.white,
          ),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5.0, 5.0), //Offset
              blurRadius: 10.0,
              spreadRadius: 2.0,
            )
          ],
          borderRadius: BorderRadius.circular(16),
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
