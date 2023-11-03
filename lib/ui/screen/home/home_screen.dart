import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/models/shoe.dart';
import 'package:shoes_shopping_app/ui/screen/cart/cart_screen.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/filter_item.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/home_item.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/icon_button_with_badge.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/search_field.dart';
import 'package:shoes_shopping_app/util/theme.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FilterType filterType = FilterType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
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
                    const Expanded(child: SearchField()),
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
              buildFilterRow(),
              const SizedBox(height: 20),
              buildItems(),
            ],
          ),
        ),
      ),
    );
  }

  buildItems() {
    return Expanded(
      child: GridView.builder(
        itemCount: shoes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) => Item(
          shoe: shoes[index],
        ),
      ),
    );
  }

  buildFilterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() => filterType = FilterType.none);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                myBoxShadow(),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.filter_alt_rounded),
                SizedBox(width: 2),
                Text(
                  'Filter',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ),
        FilterItem(
          icon: "assets/icon/nike.svg",
          isSelected: filterType == FilterType.nike,
          onClick: () {
            setState(() => filterType = FilterType.nike);
          },
        ),
        FilterItem(
          icon: "assets/icon/adidas.svg",
          isSelected: filterType == FilterType.adidas,
          onClick: () {
            setState(() => filterType = FilterType.adidas);
          },
        ),
        FilterItem(
          icon: "assets/icon/puma.svg",
          isSelected: filterType == FilterType.puma,
          onClick: () {
            setState(() => filterType = FilterType.puma);
          },
        ),
      ],
    );
  }
}

enum FilterType { none, nike, adidas, puma }
