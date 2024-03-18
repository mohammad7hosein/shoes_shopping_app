part of 'detail_bloc.dart';

enum DetailStatus { initial, loading, success, failure }

final class DetailState {
  final DetailStatus status;
  final Shoe? shoe;
  final bool isLiked;
  final String? selectedSize;
  final Color? selectedColor;

  DetailState({
    this.status = DetailStatus.initial,
    this.shoe,
    this.isLiked = false,
    this.selectedSize,
    this.selectedColor,
  });

  DetailState copyWith({
    DetailStatus? status,
    Shoe? shoe,
    bool? isLiked,
    String? selectedSize,
    Color? selectedColor,
  }) {
    return DetailState(
      status: status ?? this.status,
      shoe: shoe ?? this.shoe,
      isLiked: isLiked ?? this.isLiked,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
