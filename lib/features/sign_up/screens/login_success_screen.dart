import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_bottom_navigation.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_button.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String route = "/login_success";

  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("Login Success"),
      ),
      body: Column(
        children: [
          SizedBox(height: mediumSpace),
          Image.asset(
            Assets.imagesSuccess,
            height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(height: largeSpace),
          Text(
            "Login Success",
            style: context.textTheme.titleLarge,
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: MyButton(
              text: "Back to home",
              onPressed: () {
                Navigator.pushNamed(context, MyBottomNavigation.route);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
