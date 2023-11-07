import '../../../data/models/brand_type.dart';

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

final class HomeItemAddToFavorite extends HomeEvent {
  final int itemId;

  HomeItemAddToFavorite({required this.itemId});
}

final class HomeItemRemoveFromFavorite extends HomeEvent {
  final int itemId;

  HomeItemRemoveFromFavorite({required this.itemId});
}
