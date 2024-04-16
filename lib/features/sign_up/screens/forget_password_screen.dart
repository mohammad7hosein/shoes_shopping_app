import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/sign_up/components/forget_password_form.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String route = "/forget_password";

  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: myIcon(Assets.iconsArrowLeft),
        ),
        title: const Text("Forget Password"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Forget Password",
                    style: context.textTheme.titleLarge,
                  ),
                  const Text(
                    "Please enter your email and we will send \nyou a link to return your account",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  const ForgetPasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
