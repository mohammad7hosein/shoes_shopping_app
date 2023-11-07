import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_shopping_app/shoe_repository.dart';
import 'package:shoes_shopping_app/ui/screen/cart/cart_screen.dart';
import 'package:shoes_shopping_app/ui/screen/detail/detail_screen.dart';
import 'package:shoes_shopping_app/ui/screen/favorite/favorite_screen.dart';
import 'package:shoes_shopping_app/ui/screen/home/bloc/home_event.dart';
import 'package:shoes_shopping_app/ui/screen/home/home_screen.dart';
import 'package:shoes_shopping_app/ui/screen/main_screen.dart';
import 'package:shoes_shopping_app/ui/screen/message/message_screen.dart';
import 'package:shoes_shopping_app/ui/screen/profile/profile_screen.dart';
import 'package:shoes_shopping_app/util/size_config.dart';
import 'package:shoes_shopping_app/util/theme.dart';

import 'ui/screen/home/bloc/home_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final shoeRepository = ShoeRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(shoeRepository)..add(HomeStarted()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        routes: {
          MainScreen.route: (context) => const MainScreen(),
          HomeScreen.route: (context) => const HomeScreen(),
          CartScreen.route: (context) => const CartScreen(),
          FavoriteScreen.route: (context) => const FavoriteScreen(),
          ProfileScreen.route: (context) => const ProfileScreen(),
          MessageScreen.route: (context) => const MessageScreen(),
          DetailScreen.route: (context) => DetailScreen(),
        },
        initialRoute: MainScreen.route,
      ),
    );
  }
}
