import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';

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
      borderRadius: BorderRadius.circular(16),
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? MyTheme.primary : Colors.white,
          boxShadow: [
            myBoxShadow(),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: text != null
            ? Text(
                text!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              )
            : SvgPicture.asset(icon ?? ''),
      ),
    );
  }
}
