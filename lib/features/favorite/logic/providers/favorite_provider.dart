
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rania_store/core/models/product_model.dart';

final favoriteProvider =
    NotifierProvider<FavoriteNotifier, List<ProductModel>>(
  FavoriteNotifier.new,
);

class FavoriteNotifier extends Notifier<List<ProductModel>> {
  @override
  List<ProductModel> build() {
    return [];
  }

  void toggleFavorite(ProductModel product) {
    if (state.contains(product)) {
      state = [...state]..remove(product);
    } else {
      state = [...state, product];
    }
  }

  bool isFavorite(ProductModel product) {
    return state.contains(product);
  }

  void removeFavorite(ProductModel product) {
    state = [...state]..remove(product);
  }

  int get favoriteCount {
    return state.length;
  }
}