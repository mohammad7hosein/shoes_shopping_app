import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
