import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoes_shopping_app/core/data/model/cart.dart';
import 'package:shoes_shopping_app/core/data/repository/shoe_repository.dart';

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
              cartCount: itemCarts.length,
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
    on<HomeItemLikeClicked>(
      (event, emit) async {
        log('HomeItemLikeClicked');
        emit(state.copyWith(isLikeClicked: event.isLiked));
        if (event.isLiked) {
          await shoeRepository.addToFavorites(event.id);
        } else {
          await shoeRepository.removeFromFavorites(event.id);
        }
      },
    );
  }
}
