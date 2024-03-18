import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/data/model/shoe.dart';
import 'package:shoes_shopping_app/core/domain/repository/shoe_repository.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final ShoeRepository shoeRepository;

  DetailBloc(this.shoeRepository) : super(DetailState()) {
    log('DetailStarted');
    on<DetailStarted>(
      (event, emit) async {
        final isFavorite = await shoeRepository.isFavorite(event.id);
        emit(
          state.copyWith(
            status: DetailStatus.loading,
            isLiked: isFavorite,
            selectedSize: '',
            selectedColor: Colors.black,
          ),
        );
        try {
          final shoe = await shoeRepository.getShoeById(event.id);
          emit(
            state.copyWith(
              status: DetailStatus.success,
              shoe: shoe,
            ),
          );
        } catch (e) {
          emit(state.copyWith(status: DetailStatus.failure));
        }
      },
    );

    on<DetailAddToCart>(
      (event, emit) async {
        log('DetailAddToCart');
        emit(state.copyWith(status: DetailStatus.loading));
        try {
          await shoeRepository.addToCart(
            event.id,
            event.size,
            event.color,
            event.quantity,
          );
          emit(state.copyWith(status: DetailStatus.success));
        } catch (e) {
          emit(state.copyWith(status: DetailStatus.failure));
        }
      },
    );

    on<DetailSelectSize>(
      (event, emit) async {
        log('DetailSelectSize');
        emit(state.copyWith(selectedSize: event.size));
      },
    );

    on<DetailSelectColor>(
      (event, emit) async {
        log('DetailSelectColor');
        emit(state.copyWith(selectedColor: event.color));
      },
    );

    on<DetailLikeClicked>(
      (event, emit) async {
        log('DetailLikeClicked');
        emit(state.copyWith(isLiked: event.isLiked));
        if (event.isLiked) {
          await shoeRepository.addToFavorites(event.id);
        } else {
          await shoeRepository.removeFromFavorites(event.id);
        }
      },
    );
  }
}
