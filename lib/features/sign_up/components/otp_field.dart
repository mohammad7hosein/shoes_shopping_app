import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';

class OtpField extends StatelessWidget {
  final FocusNode? focusNode;
  final Function(String) onChanged;

  const OtpField({
    super.key,
    this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TextFormField(
        focusNode: focusNode,
        style: context.textTheme.titleMedium,
        decoration: otpInputDecoration,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: onChanged,
      ),
    );
  }
}
