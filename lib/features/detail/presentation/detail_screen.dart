import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_shopping_app/core/common/widgets/loading/loading_screen.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';
import 'package:shoes_shopping_app/features/home/presentation/components/filter_item.dart';
import 'package:shoes_shopping_app/generated/assets.dart';

import 'bloc/detail_bloc.dart';
import 'components/filter_color.dart';

class DetailScreen extends StatelessWidget {
  static const route = '/detail';

  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final shoeId = arguments['shoeId'];
    context.read<DetailBloc>().add(DetailStarted(id: shoeId));

    return BlocConsumer<DetailBloc, DetailState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == DetailStatus.loading) {
          return LoadingScreen.instance()
              .show(context: context, text: 'Loading...');
        } else {
          return LoadingScreen.instance().hide();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == DetailStatus.success) {
          return Scaffold(
            appBar: buildAppBar(context),
            body: Container(
              decoration: const BoxDecoration(color: secondaryLight),
              child: Column(
                children: [
                  buildImage(),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        ),
                        boxShadow: [myBoxShadow],
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTitleAndSubTitle(context),
                              const SizedBox(height: 24),
                              buildSizes(context),
                              const SizedBox(height: 24),
                              buildColors(context),
                              const SizedBox(height: 60),
                              buildAddToCartButton(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold();
        }
      },
    );
  }

  buildImage() {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) => previous.shoe != current.shoe,
      builder: (context, state) {
        final shoe = state.shoe!;
        return Expanded(
          flex: 2,
          child: Hero(
            tag: shoe.imageSrc,
            child: Image(
              image: AssetImage(shoe.imageSrc),
            ),
          ),
        );
      },
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: secondaryLight,
      actions: [
        BlocBuilder<DetailBloc, DetailState>(
          buildWhen: (previous, current) => previous.isLiked != current.isLiked,
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                context.read<DetailBloc>().add(
                      DetailLikeClicked(
                        id: state.shoe!.id,
                        isLiked: !state.isLiked,
                      ),
                    );
                if (!state.isLiked) {
                  context.showSnackBar('Added to favorite');
                } else {
                  context.showSnackBar('Removed from favorite');
                }
              },
              icon: myIcon(
                state.isLiked ? Assets.iconsHeartFill : Assets.iconsHeart,
                color: state.isLiked ? Colors.red : Colors.black,
              ),
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: myIcon(Assets.iconsArrowLeft),
      ),
    );
  }

  buildAddToCartButton(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        final shoe = state.shoe!;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text.rich(
                TextSpan(
                  text: "Price:\n",
                  style: context.textTheme.bodySmall?.copyWith(color: gray),
                  children: [
                    TextSpan(
                      text: '\$${shoe.price.toInt()}',
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  if (state.selectedSize == '') {
                    context.showSnackBar('Please select size');
                  } else if (state.selectedColor == Colors.black) {
                    context.showSnackBar('Please select color');
                  } else {
                    context.read<DetailBloc>().add(
                          DetailAddToCart(
                            id: shoe.id,
                            size: state.selectedSize!,
                            color: state.selectedColor!,
                            quantity: 1,
                          ),
                        );
                    context.showSnackBar('Added to cart');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    myIcon(
                      Assets.iconsShoppingCart,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "Add to cart",
                      style: buttonTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  buildColors(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) =>
          previous.selectedColor != current.selectedColor,
      builder: (context, state) {
        final colors = state.shoe!.colors;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Color',
              style: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  final item = colors[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: FilterColor(
                      color: item,
                      isSelected: state.selectedColor == item,
                      onClick: () {
                        context.read<DetailBloc>().add(
                              DetailSelectColor(color: item),
                            );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  buildSizes(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) =>
          previous.selectedSize != current.selectedSize,
      builder: (context, state) {
        final sizes = state.shoe!.sizes;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Size',
              style: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizes.length,
                itemBuilder: (context, index) {
                  final item = sizes[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: FilterItem(
                      text: item,
                      isSelected: state.selectedSize == item,
                      onClick: () {
                        context.read<DetailBloc>().add(
                              DetailSelectSize(size: item),
                            );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  buildTitleAndSubTitle(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) => previous.shoe != current.shoe,
      builder: (context, state) {
        final shoe = state.shoe!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shoe.title,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              shoe.subTitle,
              style: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
            ),
          ],
        );
      },
    );
  }
}
