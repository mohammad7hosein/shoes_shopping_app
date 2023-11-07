import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/ui/screen/home/components/filter_item.dart';
import 'package:shoes_shopping_app/util/theme.dart';

import '../../../../models/brand_type.dart';

class FilterSection extends StatelessWidget {
  final BrandType selectedBrand;
  final VoidCallback Function(BrandType brand) onClick;

  const FilterSection({
    super.key,
    required this.selectedBrand,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onClick(BrandType.none),
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
          isSelected: selectedBrand == BrandType.nike,
          onClick: onClick(BrandType.nike),
        ),
        FilterItem(
          icon: "assets/icon/adidas.svg",
          isSelected: selectedBrand == BrandType.adidas,
          onClick: onClick(BrandType.adidas),
        ),
        FilterItem(
          icon: "assets/icon/puma.svg",
          isSelected: selectedBrand == BrandType.puma,
          onClick: onClick(BrandType.puma),
        ),
      ],
    );
  }
}
