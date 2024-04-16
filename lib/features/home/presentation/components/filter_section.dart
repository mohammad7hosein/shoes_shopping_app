import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/data/model/brand_type.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/home/presentation/components/filter_item.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

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
              boxShadow: [myBoxShadow],
              borderRadius: myBorderRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.filter_alt_rounded),
                const SizedBox(width: 2),
                Text(
                  'Filter',
                  style: context.textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        FilterItem(
          icon: Assets.iconsNike,
          isSelected: selectedBrand == BrandType.nike,
          onClick: onClick(BrandType.nike),
        ),
        FilterItem(
          icon: Assets.iconsAdidas,
          isSelected: selectedBrand == BrandType.adidas,
          onClick: onClick(BrandType.adidas),
        ),
        FilterItem(
          icon: Assets.iconsPuma,
          isSelected: selectedBrand == BrandType.puma,
          onClick: onClick(BrandType.puma),
        ),
      ],
    );
  }
}
