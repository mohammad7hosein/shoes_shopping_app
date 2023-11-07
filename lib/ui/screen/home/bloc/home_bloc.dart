import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_shopping_app/shoe_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ShoeRepository shoeRepository;

  HomeBloc(this.shoeRepository) : super(HomeState()) {
    on<HomeStarted>(
      (event, emit) async {
        log('HomeStarted');
        emit(state.copyWith(status: HomeStatus.loading));
        try {
          final shoes = await shoeRepository.loadShoes();
          emit(
            state.copyWith(
              status: HomeStatus.success,
              shoes: shoes,
            ),
          );
        } catch (e) {
          emit(state.copyWith(status: HomeStatus.failure));
        }
      },
    );
    on<HomeSearchItems>(
      (event, emit) async {
        log('HomeSearchItems');
        emit(state.copyWith(status: HomeStatus.loading));
        try {
          final shoes = await shoeRepository.searchShoes(event.query);
          emit(
            state.copyWith(status: HomeStatus.success, shoes: shoes),
          );
        } catch (e) {
          emit(state.copyWith(status: HomeStatus.failure));
        }
      },
    );
    on<HomeFilterItems>(
      (event, emit) async {
        log('HomeFilterItems');
        emit(state.copyWith(status: HomeStatus.loading));
        try {
          final shoes = await shoeRepository.filterShoes(event.brandType);
          emit(
            state.copyWith(
              status: HomeStatus.success,
              shoes: shoes,
              selectedFilter: event.brandType,
            ),
          );
        } catch (e) {
          emit(state.copyWith(status: HomeStatus.failure));
        }
      },
    );
    on<HomeItemAddToFavorite>(
      (event, emit) {
        log('HomeItemAddToFavorite');
        try {
          shoeRepository.addToFavorites(event.itemId).then(
                (isSuccess) => emit(
                  isSuccess
                      ? state.copyWith(status: HomeStatus.success, isLiked: true)
                      : state.copyWith(status: HomeStatus.failure),
                ),
              );
        } catch (e) {
          emit(state.copyWith(status: HomeStatus.failure));
        }
      },
    );
    on<HomeItemRemoveFromFavorite>(
      (event, emit) {
        log('HomeItemRemoveFromFavorite');
        try {
          shoeRepository.removeFromFavorites(event.itemId).then(
                (isSuccess) => emit(
                  isSuccess
                      ? state.copyWith(status: HomeStatus.success, isLiked: false)
                      : state.copyWith(status: HomeStatus.failure),
                ),
              );
        } catch (e) {
          emit(state.copyWith(status: HomeStatus.failure));
        }
      },
    );
    // on<HomeItemClicked>(
    //   (event, emit) async {
    //     emit(state.copyWith(status: HomeStatus.loading));
    //     try {
    //       final shoe = await shoeRepository.getShoeById(event.itemId);
    //       emit(
    //         shoe == null ? state.copyWith(status: HomeStatus.failure) : HomeGetItemSuccess(shoe: shoe),
    //       );
    //     } catch (e) {
    //       emit(state.copyWith(status: HomeStatus.failure));
    //     }
    //   },
    // );
  }
}
