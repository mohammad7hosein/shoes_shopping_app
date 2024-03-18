import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_app_bar.dart';

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
              icon: Iconsax.user,
              onClick: () {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Iconsax.notification,
              onClick: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: Iconsax.setting_2,
              onClick: () {},
            ),
            ProfileMenu(
              text: "About Us",
              icon: Iconsax.info_circle,
              onClick: () {},
            ),
            ProfileMenu(
              text: "Log out",
              icon: Iconsax.logout,
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
