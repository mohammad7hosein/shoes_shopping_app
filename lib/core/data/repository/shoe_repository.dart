import 'dart:ui';

import 'package:shoes_shopping_app/core/data/model/brand_type.dart';
import 'package:shoes_shopping_app/core/data/model/cart.dart';
import 'package:shoes_shopping_app/core/data/model/shoe.dart';

class ShoeRepository {
  Future<List<Shoe>> loadShoes() async {
    await Future.delayed(const Duration(seconds: 1));
    return shoes;
  }

  Future<List<Shoe>> filterShoes(BrandType brandType) async {
    await Future.delayed(const Duration(seconds: 1));
    if (brandType == BrandType.none) return shoes;
    return shoes.where((shoe) => shoe.brandType == brandType).toList();
  }

  Future<List<Shoe>> searchShoes(String query) async {
    await Future.delayed(const Duration(seconds: 1));
    return shoes
        .where((shoe) =>
            shoe.title.toLowerCase().contains(query.toLowerCase()) ||
            shoe.subTitle.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<List<Shoe>> getFavoriteShoes() async {
    await Future.delayed(const Duration(seconds: 1));
    return shoes.where((shoe) => shoe.isFavorite).toList();
  }

  Future<bool> addToFavorites(int id) async {
    final index = shoes.indexWhere((shoe) => shoe.id == id);
    if (index != -1) {
      shoes[index].isFavorite = true;
      return true;
    }
    return false;
  }

  Future<bool> removeFromFavorites(int id) async {
    final index = shoes.indexWhere((shoe) => shoe.id == id);
    if (index != -1) {
      shoes[index].isFavorite = false;
      return true;
    }
    return false;
  }

  Future<Shoe?> getShoeById(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = shoes.indexWhere((shoe) => shoe.id == id);
    if (index != -1) {
      return shoes[index];
    }
    return null;
  }

  Future<void> addToCart(int id, String size, Color color, int quantity) async {
    final index = itemCarts.indexWhere((itemCart) =>
        itemCart.id == id && itemCart.size == size && itemCart.color == color);
    if (index != -1) {
      itemCarts[index].quantity = quantity;
      return;
    }

    itemCarts.add(
      Cart.fromShoe(
        shoe: shoes.firstWhere((shoe) => shoe.id == id),
        size: size,
        color: color,
        quantity: quantity,
      ),
    );
  }

  Future<void> removeFromCart(int id, String size, Color color) async {
    final index = itemCarts.indexWhere((itemCart) =>
        itemCart.id == id && itemCart.size == size && itemCart.color == color);
    if (index != -1) {
      itemCarts.removeAt(index);
      return;
    }
  }

  Future<bool> isFavorite(int id) {
    final index = shoes.indexWhere((shoe) => shoe.id == id);
    if (index != -1) {
      return Future.value(shoes[index].isFavorite);
    }
    return Future.value(false);
  }

  Future<List<Cart>> loadCartItems() async {
    await Future.delayed(const Duration(seconds: 1));
    return itemCarts;
  }

  Future<double> getTotalCartPrice() async {
    return itemCarts.fold<double>(
      0.0,
      (previousValue, element) =>
          previousValue + (element.price * element.quantity),
    );
  }
}