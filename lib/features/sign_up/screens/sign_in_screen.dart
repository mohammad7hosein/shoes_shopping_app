import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/sign_up/components/forms/sign_in_form.dart';
import 'package:shoes_shopping_app/features/sign_up/components/no_account_text.dart';
import 'package:shoes_shopping_app/features/sign_up/components/social_card.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static String route = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("Sign in"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text(
                    "Welcome Back",
                    style: context.textTheme.titleLarge,
                  ),
                  const Text(
                    "Sign with your email and password \nor cotinue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  const SignForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SocialCard.buildSocialCards(),
                  const SizedBox(height: 20),
                  const NoAccountText(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
