import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/sign_up/screens/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: context.textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.route);
          },
          child: Text(
            "SignUp",
            style: context.textTheme.bodyMedium
                ?.copyWith(color: context.scheme.primary),
          ),
        ),
      ],
    );
  }
}
