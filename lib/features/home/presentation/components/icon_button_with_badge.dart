import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';

class IconButtonWithBadge extends StatelessWidget {
  final Widget icon;
  final int number;
  final VoidCallback onClick;

  const IconButtonWithBadge({
    Key? key,
    required this.icon,
    required this.onClick,
    this.number = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: myBorderRadius,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.scheme.surface,
              borderRadius: myBorderRadius,
            ),
            child: icon,
          ),
          if (number != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: context.scheme.surface, width: 1),
                ),
                child: Center(
                  child: Text(
                    "$number",
                    style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.scheme.onPrimary,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
