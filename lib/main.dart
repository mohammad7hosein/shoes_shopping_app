import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_shopping_app/domain/shoe_repository.dart';
import 'package:shoes_shopping_app/feature/detail/bloc/detail_bloc.dart';

import 'feature/cart/cart_screen.dart';
import 'feature/detail/detail_screen.dart';
import 'feature/favorite/favorite_screen.dart';
import 'feature/home/bloc/home_bloc.dart';
import 'feature/home/bloc/home_event.dart';
import 'feature/home/home_screen.dart';
import 'feature/message/message_screen.dart';
import 'feature/profile/profile_screen.dart';
import 'util/size_config.dart';
import 'util/theme.dart';
import 'widgets/my_bottom_navigation.dart';

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
        BlocProvider<DetailBloc>(
          create: (context) => DetailBloc(shoeRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme,
        routes: {
          MyBottomNavigation.route: (context) => const MyBottomNavigation(),
          HomeScreen.route: (context) => const HomeScreen(),
          CartScreen.route: (context) => const CartScreen(),
          FavoriteScreen.route: (context) => const FavoriteScreen(),
          ProfileScreen.route: (context) => const ProfileScreen(),
          MessageScreen.route: (context) => const MessageScreen(),
          DetailScreen.route: (context) => DetailScreen(),
        },
        initialRoute: MyBottomNavigation.route,
      ),
    );
  }
}
