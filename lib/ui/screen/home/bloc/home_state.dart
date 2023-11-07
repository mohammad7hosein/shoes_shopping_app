import 'package:shoes_shopping_app/models/brand_type.dart';
import 'package:shoes_shopping_app/models/shoe.dart';

enum HomeStatus { initial, loading, success, failure }

final class HomeState {
  final HomeStatus status;
  final BrandType selectedFilter;
  final List<Shoe> shoes;
  final bool? isLiked;

  HomeState({
    this.status = HomeStatus.initial,
    this.selectedFilter = BrandType.none,
    this.shoes = const [],
    this.isLiked,
  });

  HomeState copyWith({
    HomeStatus? status,
    BrandType? selectedFilter,
    List<Shoe>? shoes,
    bool? isLiked,
  }) {
    return HomeState(
      status: status ?? this.status,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      shoes: shoes ?? this.shoes,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}