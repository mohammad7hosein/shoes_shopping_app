import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/ui/screen/cart/cart_screen.dart';
import 'package:shoes_shopping_app/ui/screen/detail/detail_screen.dart';
import 'package:shoes_shopping_app/ui/screen/home/bloc/home_event.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/filter_section.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/home_item.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/icon_button_with_badge.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/search_field.dart';
import 'package:shoes_shopping_app/ui/widgets/my_snack_bar.dart';
import 'package:shoes_shopping_app/util/theme.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<HomeBloc, HomeState>(
            listenWhen: (previous, current) {
              return current.isLiked != null && previous != current;
            },
            listener: (context, state) {
              if (state.isLiked!) {
                ScaffoldMessenger.of(context).showSnackBar(
                  mySnackBar(context, 'Added to favorite'),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  mySnackBar(context, 'Removed from favorite'),
                );
              }
            },
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state.status == HomeStatus.loading) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    color: MyTheme.primary,
                    radius: 16,
                  ),
                );
              } else if (state.status == HomeStatus.success) {
                final shoes = state.shoes;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Shoes',
                        style: TextStyle(
                          fontFamily: 'Futura',
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SearchField(
                              onSearch: (String query) {
                                context.read<HomeBloc>().add(
                                      HomeSearchItems(query: query),
                                    );
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          IconButtonWithBadge(
                            icon: Iconsax.shopping_cart,
                            onClick: () =>
                                Navigator.pushNamed(context, CartScreen.route),
                            number: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    FilterSection(
                      selectedBrand: state.selectedFilter,
                      onClick: (brand) => () {
                        context.read<HomeBloc>().add(
                              HomeFilterItems(brandType: brand),
                            );
                      },
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        itemCount: shoes.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) => HomeItem(
                          shoe: shoes[index],
                          onClick: () {
                            Navigator.pushNamed(context, DetailScreen.route);
                          },
                          onLike: () {
                            if (shoes[index].isFavorite) {
                              context.read<HomeBloc>().add(
                                    HomeItemRemoveFromFavorite(
                                        itemId: shoes[index].id),
                                  );
                            } else {
                              context.read<HomeBloc>().add(
                                    HomeItemAddToFavorite(
                                        itemId: shoes[index].id),
                                  );
                            }
                          },
                          isLiked: shoes[index].isFavorite,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
