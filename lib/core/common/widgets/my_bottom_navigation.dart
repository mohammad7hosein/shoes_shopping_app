import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/features/favorite/presentation/favorite_screen.dart';
import 'package:shoes_shopping_app/features/home/presentation/home_screen.dart';
import 'package:shoes_shopping_app/features/message/presentation/message_screen.dart';
import 'package:shoes_shopping_app/features/profile/presentation/profile_screen.dart';

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
}
