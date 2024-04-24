import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_shopping_app/core/common/widgets/loading/loading_screen.dart';
import 'package:shoes_shopping_app/core/styles/size_config.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/cart/presentation/cart_screen.dart';
import 'package:shoes_shopping_app/features/detail/presentation/detail_screen.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
import 'components/filter_section.dart';
import 'components/home_item.dart';
import 'components/icon_button_with_badge.dart';
import 'components/search_field.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocListener<HomeBloc, HomeState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == HomeStatus.loading) {
                return LoadingScreen.instance()
                    .show(context: context, text: 'Loading...');
              } else {
                return LoadingScreen.instance().hide();
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: smallSpace),
                Text(
                  "Seyed Shoes",
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontFamily: 'Futura'),
                ),
                SizedBox(height: mediumSpace),
                buildSearchAndCartButton(),
                SizedBox(height: smallSpace),
                buildFilterSection(),
                SizedBox(height: smallSpace),
                buildShoes(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildShoes() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.status != current.status || current.isLikeClicked != null,
      builder: (context, state) {
        final shoes = state.shoes;
        return Expanded(
          child: GridView.builder(
            itemCount: shoes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => HomeItem(
              shoe: shoes[index],
              onClick: () {
                Navigator.pushNamed(
                  context,
                  DetailScreen.route,
                  arguments: {'shoeId': shoes[index].id},
                );
              },
              onLike: () {
                context.read<HomeBloc>().add(
                      HomeItemLikeClicked(
                        id: shoes[index].id,
                        isLiked: !shoes[index].isFavorite,
                      ),
                    );
                if (!shoes[index].isFavorite) {
                  context.showSnackBar('Added to favorite');
                } else {
                  context.showSnackBar('Removed from favorite');
                }
              },
              isLiked: shoes[index].isFavorite,
            ),
          ),
        );
      },
    );
  }

  buildFilterSection() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.selectedFilter != current.selectedFilter,
      builder: (context, state) {
        return FilterSection(
          selectedBrand: state.selectedFilter,
          onClick: (brand) => () {
            context.read<HomeBloc>().add(HomeFilterItems(brandType: brand));
          },
        );
      },
    );
  }

  buildSearchAndCartButton() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SearchField(
                  onSearch: (String query) {
                    context.read<HomeBloc>().add(HomeSearchItems(query: query));
                  },
                ),
              ),
              const SizedBox(width: 16),
              IconButtonWithBadge(
                icon: myIcon(context, Assets.iconsShoppingCart),
                onClick: () => Navigator.pushNamed(context, CartScreen.route),
                number: state.cartCount,
              ),
            ],
          ),
        );
      },
    );
  }
}
