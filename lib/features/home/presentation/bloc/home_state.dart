import 'package:shoes_shopping_app/core/data/model/brand_type.dart';
import 'package:shoes_shopping_app/core/data/model/shoe.dart';

enum HomeStatus { initial, loading, success, failure }

final class HomeState {
  final HomeStatus status;
  final BrandType selectedFilter;
  final List<Shoe> shoes;
  final bool? isLikeClicked;
  final int cartCount;

  HomeState({
    this.status = HomeStatus.initial,
    this.selectedFilter = BrandType.none,
    this.shoes = const [],
    this.isLikeClicked,
    this.cartCount = 0,
  });

  HomeState copyWith({
    HomeStatus? status,
    BrandType? selectedFilter,
    List<Shoe>? shoes,
    bool? isLikeClicked,
    int? cartCount,
  }) {
    return HomeState(
      status: status ?? this.status,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      shoes: shoes ?? this.shoes,
      isLikeClicked: isLikeClicked ?? this.isLikeClicked,
      cartCount: cartCount ?? this.cartCount,
    );
  }
}
