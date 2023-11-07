import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/util/theme.dart';

import '../feature/favorite/favorite_screen.dart';
import '../feature/home/home_screen.dart';
import '../feature/message/message_screen.dart';
import '../feature/profile/profile_screen.dart';

enum NavBarItem { home, favorite, message, profile }

class MyBottomNavigation extends StatefulWidget {
  static const String route = '/main';

  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
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
