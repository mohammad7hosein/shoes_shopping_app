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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(smallSpace),
          child: Column(
            children: [
              Text(
                "Welcome Back",
                style: context.textTheme.titleLarge,
              ),
              SizedBox(height: verySmallSpace),
              Text(
                "Sign with your email and password \nor cotinue with social media",
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: largeSpace),
              const SignForm(),
              SizedBox(height: largeSpace),
              SocialCard.buildSocialCards(),
              SizedBox(height: smallSpace),
              const NoAccountText(),
              SizedBox(height: smallSpace),
            ],
          ),
        ),
      ),
    );
  }
}
