import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shoes_shopping_app/core/common/widgets/loading/loading_screen.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_snack_bar.dart';
import 'package:shoes_shopping_app/core/styles/theme.dart';
import 'package:shoes_shopping_app/features/home/presentation/components/filter_item.dart';

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

    final textTheme = Theme.of(context).textTheme;

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
              decoration: const BoxDecoration(color: MyTheme.secondaryLight),
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
                        boxShadow: [myBoxShadow()],
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTitleAndSubTitle(textTheme),
                              const SizedBox(height: 24),
                              buildSizes(textTheme),
                              const SizedBox(height: 24),
                              buildColors(textTheme),
                              const SizedBox(height: 60),
                              buildAddToCartButton(textTheme),
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
      backgroundColor: MyTheme.secondaryLight,
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    mySnackBar(context, 'Added to favorite'),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    mySnackBar(context, 'Removed from favorite'),
                  );
                }
              },
              icon: Icon(
                state.isLiked ? Iconsax.heart5 : Iconsax.heart,
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
        icon: const Icon(Iconsax.arrow_left_2),
      ),
    );
  }

  buildAddToCartButton(TextTheme textTheme) {
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
                  style: textTheme.bodySmall?.copyWith(color: MyTheme.gray),
                  children: [
                    TextSpan(
                      text: '\$${shoe.price.toInt()}',
                      style: textTheme.titleSmall,
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      mySnackBar(context, 'Please select size'),
                    );
                  } else if (state.selectedColor == Colors.black) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      mySnackBar(context, 'Please select color'),
                    );
                  } else {
                    context.read<DetailBloc>().add(
                          DetailAddToCart(
                            id: shoe.id,
                            size: state.selectedSize!,
                            color: state.selectedColor!,
                            quantity: 1,
                          ),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      mySnackBar(context, 'Added to cart'),
                    );
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Iconsax.shopping_cart),
                    SizedBox(width: 16),
                    Text("Add to cart"),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  buildColors(TextTheme textTheme) {
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
              style: textTheme.titleSmall?.copyWith(color: Colors.grey),
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

  buildSizes(TextTheme textTheme) {
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
              style: textTheme.titleSmall?.copyWith(color: Colors.grey),
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

  buildTitleAndSubTitle(TextTheme textTheme) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) => previous.shoe != current.shoe,
      builder: (context, state) {
        final shoe = state.shoe!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shoe.title,
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              shoe.subTitle,
              style: textTheme.titleSmall?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }
}
