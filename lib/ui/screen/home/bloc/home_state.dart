

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoadInProgress extends HomeState {}
final class HomeLoadSuccess extends HomeState {}
final class HomeLoadFailure extends HomeState {}
