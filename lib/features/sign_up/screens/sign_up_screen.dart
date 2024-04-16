import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/sign_up/components/sign_up_form.dart';
import 'package:shoes_shopping_app/features/sign_up/components/social_card.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class SignUpScreen extends StatelessWidget {
  static String route = "/sign_up";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: myIcon(Assets.iconsArrowLeft)),
        title: const Text("Sign Up"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Register Account",
                  style: context.textTheme.titleLarge,
                ),
                const Text(
                  "Compelete your email or continue \nwith your social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SocialCard.buildSocialCards(),
                const SizedBox(height: 20),
                const Text(
                  "By continuing your confirm that you agree \nwith our term and Conditoin",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
