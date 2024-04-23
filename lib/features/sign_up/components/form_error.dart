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
        (index) => formErrorText(context, error: errors[index]),
      ),
    );
  }

  Widget formErrorText(BuildContext context, {required String error}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          myIcon(
            context,
            Assets.iconsError,
            color: Colors.red,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(error),
        ],
      ),
    );
  }
}
