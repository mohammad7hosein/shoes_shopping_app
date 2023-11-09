import 'package:bloc/bloc.dart';
import 'package:shoes_shopping_app/data/models/cart.dart';
import 'package:shoes_shopping_app/feature/cart/bloc/cart_event.dart';
import 'package:shoes_shopping_app/feature/cart/bloc/cart_state.dart';

import '../../../domain/shoe_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ShoeRepository shoeRepository;

  CartBloc(this.shoeRepository) : super(const CartState()) {
    on<CartStarted>(
      (event, emit) async {
        emit(state.copyWith(status: CartStatus.loading));
        try {
          final cartItems = await shoeRepository.loadCartItems();
          final totalPrice = await shoeRepository.getTotalCartPrice();
          emit(
            state.copyWith(
              status: CartStatus.success,
              cartItems: cartItems,
              totalPrice: totalPrice,
            ),
          );
        } catch (e) {
          emit(state.copyWith(status: CartStatus.failure));
        }
      },
    );

    on<CartItemQuantityChanged>(
      (event, emit) async {
        emit(state.copyWith(status: CartStatus.loading));
        try {
          if (event.quantity == 0) {
            await shoeRepository.removeFromCart(
              event.id,
              event.size,
              event.color,
            );
          } else {
            await shoeRepository.addToCart(
              event.id,
              event.size,
              event.color,
              event.quantity,
            );
          }
          final cartItems = await shoeRepository.loadCartItems();
          final totalPrice = await shoeRepository.getTotalCartPrice();
          emit(
            state.copyWith(
              status: CartStatus.success,
              cartItems: cartItems,
              totalPrice: totalPrice,
            ),
          );
        } catch (e) {
          emit(state.copyWith(status: CartStatus.failure));
        }
      },
    );

    on<CartItemRemoved>(
      (event, emit) async {
        emit(state.copyWith(status: CartStatus.loading));
        try {
          await shoeRepository.removeFromCart(
            event.id,
            event.size,
            event.color,
          );
          final cartItems = await shoeRepository.loadCartItems();
          final totalPrice = await shoeRepository.getTotalCartPrice();
          emit(
            state.copyWith(
              status: CartStatus.success,
              cartItems: cartItems,
              totalPrice: totalPrice,
            ),
          );
        } catch (e) {
          emit(state.copyWith(status: CartStatus.failure));
        }
      },
    );

    on<CartCheckout>((event, emit) {
      emit(state.copyWith(status: CartStatus.loading));
      itemCarts.clear();
      emit(
        state.copyWith(
          status: CartStatus.success,
          cartItems: itemCarts,
          totalPrice: 0,
        ),
      );
    });
  }
}
