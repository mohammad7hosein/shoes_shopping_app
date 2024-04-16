import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class FormError extends StatelessWidget {
  final List<String> errors;

  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => formErrorText(error: errors[index]),
      ),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        myIcon(
          Assets.iconsError,
          color: Colors.red,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(error),
      ],
    );
  }
}
