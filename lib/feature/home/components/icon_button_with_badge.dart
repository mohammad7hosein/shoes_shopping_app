import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/util/theme.dart';

class IconButtonWithBadge extends StatelessWidget {
  final IconData icon;
  final int number;
  final VoidCallback onClick;

  const IconButtonWithBadge({
    Key? key,
    required this.icon,
    this.number = 0,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                myBoxShadow(),
              ],
            ),
            child: Icon(icon),
          ),
          if (number != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xffff4848),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Center(
                  child: Text(
                    "$number",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 10,
                      height: 1,
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
