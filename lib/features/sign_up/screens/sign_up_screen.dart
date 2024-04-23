import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/sign_up/components/forms/sign_up_form.dart';
import 'package:shoes_shopping_app/features/sign_up/components/social_card.dart';

class SignUpScreen extends StatelessWidget {
  static String route = "/sign_up";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(smallSpace),
          child: Column(
            children: [
              Text(
                "Register Account",
                style: context.textTheme.titleLarge,
              ),
              SizedBox(height: verySmallSpace),
              Text(
                "Compelete your email or continue \nwith your social media",
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: largeSpace),
              const SignUpForm(),
              SizedBox(height: largeSpace),
              SocialCard.buildSocialCards(),
              SizedBox(height: verySmallSpace),
              Text(
                "By continuing your confirm that you agree \nwith our term and Conditoin",
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: smallSpace),
            ],
          ),
        ),
      ),
    );
  }
}
