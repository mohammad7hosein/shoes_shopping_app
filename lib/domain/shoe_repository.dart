import '../data/models/brand_type.dart';
import '../data/models/shoe.dart';

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
}
