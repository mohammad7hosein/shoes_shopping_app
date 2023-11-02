import 'package:shoes_shopping_app/models.dart';

class ShoeRepository {
  Future<List<Shoe>> loadShoes() async {
    await Future.delayed(const Duration(seconds: 2));
    return shoes;
  }

  Future<List<Shoe>> filterShoes(Brand brand) async {
    await Future.delayed(const Duration(seconds: 2));
    return shoes.where((shoe) => shoe.brand == brand).toList();
  }

  Future<List<Shoe>> searchShoes(String query) async {
    await Future.delayed(const Duration(seconds: 2));
    return shoes
        .where((shoe) =>
            shoe.title.toLowerCase().contains(query.toLowerCase()) ||
            shoe.subTitle.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<List<Shoe>> getFavoriteShoes() async {
    await Future.delayed(const Duration(seconds: 2));
    return shoes.where((shoe) => shoe.isFavorite).toList();
  }

  bool addToFavorites(int id) {
    final index = shoes.indexWhere((shoe) => shoe.id == id);
    if (index != -1) {
      shoes[index].isFavorite = true;
      return true;
    }
    return false;
  }

  Future<Shoe?> getShoeById(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    final index = shoes.indexWhere((shoe) => shoe.id == id);
    if (index != -1) {
      return shoes[index];
    }
    return null;
  }

}
