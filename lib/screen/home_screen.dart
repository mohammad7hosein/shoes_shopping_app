import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoes_shopping_app/models.dart';
import 'package:shoes_shopping_app/util/theme.dart';
import 'package:shoes_shopping_app/widgets/search_field.dart';

import '../filterButton.dart';
import '../item.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.light,
      body: SafeArea(
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
            const SearchField(),
            const SizedBox(height: 10),
            buildFilterRow(),
            buildItems(),
          ],
        ),
      ),
    );
  }

  Expanded buildItems() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
          itemCount: shoes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) => Item(shoes[index])),
    ));
  }

  Padding buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(5.0, 5.0), //Offset
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.filter_alt_rounded),
                Text(
                  'Filter',
                  style: TextStyle(
                    fontFamily: 'Futura',
                    color: Colors.black,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          FilterButton(null, SvgPicture.asset("assets/icon/nike.svg"), false),
          FilterButton(null, SvgPicture.asset("assets/icon/adidas.svg"), false),
          FilterButton(null, SvgPicture.asset("assets/icon/puma.svg"), false)
        ],
      ),
    );
  }
}
