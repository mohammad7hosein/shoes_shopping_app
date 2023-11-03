
sealed class HomeEvent {}

final class HomeStarted extends HomeEvent {}
final class HomeSearchItems extends HomeEvent {}
final class HomeFilterItems extends HomeEvent {}
final class HomeItemLiked extends HomeEvent {}
final class HomeItemClicked extends HomeEvent {}