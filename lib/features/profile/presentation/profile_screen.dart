import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';
import 'package:shoes_shopping_app/features/sign_up/screens/complete_profile_screen.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static const route = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const ProfilePic(),
            const SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: "My Account",
              icon: Assets.iconsUser,
              onClick: () =>
                  Navigator.pushNamed(context, CompleteProfileScreen.route),
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
