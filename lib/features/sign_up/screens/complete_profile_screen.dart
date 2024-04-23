import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/sign_up/components/forms/complete_profile_form.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String route = "/complete_profile";

  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: EdgeInsets.all(smallSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Complete Profile",
                style: context.textTheme.titleMedium,
              ),
              SizedBox(height: verySmallSpace),
              Text(
                "Compelete your details or continue \nwith your social media",
                style: context.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: mediumSpace),
              const CompleteProfileForm(),
              SizedBox(height: mediumSpace),
              const Text(
                "By continuing your confirm that you agree \nwith our term and Conditoin",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
