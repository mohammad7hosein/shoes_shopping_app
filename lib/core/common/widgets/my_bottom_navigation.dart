import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/features/favorite/presentation/favorite_screen.dart';
import 'package:shoes_shopping_app/features/home/presentation/home_screen.dart';
import 'package:shoes_shopping_app/features/message/presentation/message_screen.dart';
import 'package:shoes_shopping_app/features/profile/presentation/profile_screen.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

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
        items: [
          BottomNavigationBarItem(
            icon: myIcon(
              Assets.iconsShop,
              color: getColor(0),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: myIcon(
              Assets.iconsHeart,
              color: getColor(1),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: myIcon(
              Assets.iconsMessage,
              color: getColor(2),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: myIcon(
              Assets.iconsUser,
              color: getColor(3),
            ),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        selectedItemColor: primary,
        unselectedItemColor: gray,
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

  getColor(int index) => _selectedIndex == index ? primary : gray;
}
