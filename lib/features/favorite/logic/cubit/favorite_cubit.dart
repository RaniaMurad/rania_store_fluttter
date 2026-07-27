import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rania_store/core/models/product_model.dart';

import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState.initial());

  final List<ProductModel> favorites = [];

  // إضافة أو حذف من المفضلة
  void toggleFavorite(ProductModel product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }

    emit(const FavoriteState.updated());
  }

  // هل المنتج موجود في المفضلة؟
  bool isFavorite(ProductModel product) {
    return favorites.contains(product);
  }

  // حذف منتج
  void removeFavorite(ProductModel product) {
    favorites.remove(product);

    emit(const FavoriteState.updated());
  }

  // عدد المنتجات
  int get favoriteCount {
    return favorites.length;
  }
}
