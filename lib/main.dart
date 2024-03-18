import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';

import 'core/common/widgets/my_bottom_navigation.dart';
import 'core/domain/repository/shoe_repository.dart';
import 'core/styles/theme.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/cart/presentation/cart_screen.dart';
import 'features/detail/presentation/bloc/detail_bloc.dart';
import 'features/detail/presentation/detail_screen.dart';
import 'features/favorite/presentation/favorite_screen.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/bloc/home_event.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/message/presentation/message_screen.dart';
import 'features/profile/presentation/profile_screen.dart';

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
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(shoeRepository),
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
          DetailScreen.route: (context) => const DetailScreen(),
        },
        initialRoute: MyBottomNavigation.route,
      ),
    );
  }
}
