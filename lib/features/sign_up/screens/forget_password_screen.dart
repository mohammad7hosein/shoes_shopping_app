import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/sign_up/components/forms/forget_password_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String route = "/forget_password";

  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("Forget Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(smallSpace),
          child: Column(
            children: [
              Text(
                "Forget Password",
                style: context.textTheme.titleLarge,
              ),
              SizedBox(height: verySmallSpace),
              Text(
                "Please enter your email and we will send \nyou a link to return your account",
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: largeSpace),
              const ForgetPasswordForm(),
              SizedBox(height: largeSpace),
            ],
          ),
        ),
      ),
    );
  }
}
