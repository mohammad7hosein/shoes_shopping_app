import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/ui/screen/message/message_screen.dart';
import 'package:shoes_shopping_app/util/theme.dart';

import 'favorite/favorite_screen.dart';
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';

enum NavBarItem { home, favorite, message, profile }

class MainScreen extends StatefulWidget {
  static const String route = '/main';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = NavBarItem.home.index;
  final pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shop),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.message),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        selectedItemColor: MyTheme.primary,
        unselectedItemColor: MyTheme.gray,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
