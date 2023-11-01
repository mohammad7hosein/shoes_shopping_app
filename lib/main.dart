import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes_shopping_app/screen/cart_screen.dart';
import 'package:shoes_shopping_app/screen/favorite_screen.dart';
import 'package:shoes_shopping_app/screen/main_screen.dart';
import 'package:shoes_shopping_app/screen/profile/profile_screen.dart';
import 'package:shoes_shopping_app/util/size_config.dart';
import 'package:shoes_shopping_app/util/theme.dart';

import 'screen/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        MainScreen.route: (context) => const MainScreen(),
        HomeScreen.route: (context) => const HomeScreen(),
        CartScreen.route: (context) => const CartScreen(),
        FavoriteScreen.route: (context) => const FavoriteScreen(),
        ProfileScreen.route: (context) => const ProfileScreen(),
        // DetailScreen.route: (context) => const DetailScreen(),
      },
      initialRoute: MainScreen.route,
    );
  }
}
