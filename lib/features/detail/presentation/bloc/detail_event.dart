part of 'detail_bloc.dart';

sealed class DetailEvent {}

final class DetailStarted extends DetailEvent {
  final int id;

  DetailStarted({required this.id});
}

final class DetailAddToCart extends DetailEvent {
  final int id;
  final String size;
  final Color color;
  final int quantity;

  DetailAddToCart({
    required this.id,
    required this.size,
    required this.color,
    required this.quantity,
  });
}

final class DetailSelectSize extends DetailEvent {
  final String size;

  DetailSelectSize({required this.size});
}

final class DetailSelectColor extends DetailEvent {
  final Color color;

  DetailSelectColor({required this.color});
}

final class DetailLikeClicked extends DetailEvent {
  final int id;
  final bool isLiked;

  DetailLikeClicked({
    required this.id,
    required this.isLiked,
  });
}
