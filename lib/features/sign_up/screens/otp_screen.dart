import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/sign_up/components/forms/otp_form.dart';

class OtpScreen extends StatelessWidget {
  static String route = "/otp";

  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("OTP Verificcation"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text(
                  "OTP Verification",
                  style: context.textTheme.titleLarge,
                ),
                const Text(
                  "We sent your code to +98 919 542 ****",
                  textAlign: TextAlign.center,
                ),
                buildTimer(),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                const OtpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                GestureDetector(
                  onTap: () {
                    // resend your otp
                  },
                  child: const Text(
                    "Resend OTP code",
                    style: TextStyle(decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toString().substring(0, 2)}",
            style: context.textTheme.bodyMedium
                ?.copyWith(color: context.scheme.primary),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
