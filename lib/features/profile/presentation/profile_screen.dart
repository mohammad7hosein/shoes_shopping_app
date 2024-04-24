import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/features/sign_up/screens/sign_in_screen.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static const route = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: smallSpace),
            const ProfilePic(),
            SizedBox(height: smallSpace),
            ProfileMenu(
              text: "My Account",
              icon: Assets.iconsUser,
              onClick: () => Navigator.pushNamed(context, SignInScreen.route),
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Assets.iconsNotification,
              onClick: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: Assets.iconsSetting,
              onClick: () {},
            ),
            ProfileMenu(
              text: "About Us",
              icon: Assets.iconsInfoCircle,
              onClick: () {},
            ),
            ProfileMenu(
              text: "Log out",
              icon: Assets.iconsLogout,
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
