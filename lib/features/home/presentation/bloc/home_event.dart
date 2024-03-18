import 'package:shoes_shopping_app/core/data/model/brand_type.dart';

sealed class HomeEvent {}

final class HomeStarted extends HomeEvent {}

final class HomeSearchItems extends HomeEvent {
  final String query;

  HomeSearchItems({required this.query});
}

final class HomeFilterItems extends HomeEvent {
  final BrandType brandType;

  HomeFilterItems({required this.brandType});
}

final class HomeItemLikeClicked extends HomeEvent {
  final int id;
  final bool isLiked;

  HomeItemLikeClicked({
    required this.id,
    required this.isLiked,
  });
}
