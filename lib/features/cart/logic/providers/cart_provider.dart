
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rania_store/features/products/new/cart_item_model_new.dart';

final cartProvider =
    NotifierProvider<CartNotifier, List<CartItemModel>>(
  CartNotifier.new,
);

class CartNotifier extends Notifier<List<CartItemModel>> {
  @override
  List<CartItemModel> build() {
    return [];
  }

  // إضافة منتج إلى السلة
  void addToCart(CartItemModel item) {
    final currentItems = [...state];

    final existingIndex = currentItems.indexWhere(
      (cartItem) =>
          cartItem.product.id == item.product.id &&
          cartItem.color == item.color &&
          cartItem.size == item.size,
    );

    if (existingIndex != -1) {
      currentItems[existingIndex] = currentItems[existingIndex].copyWith(
        quantity: currentItems[existingIndex].quantity + item.quantity,
      );
    } else {
      currentItems.add(item);
    }

    state = currentItems;
  }

  // حذف منتج من السلة
  void removeFromCart(CartItemModel item) {
    final currentItems = [...state];

    currentItems.remove(item);

    state = currentItems;
  }

  // زيادة الكمية
  void increaseQuantity(CartItemModel item) {
    final currentItems = [...state];

    final index = currentItems.indexOf(item);

    if (index != -1) {
      currentItems[index] = currentItems[index].copyWith(
        quantity: currentItems[index].quantity + 1,
      );

      state = currentItems;
    }
  }

  // تقليل الكمية
  void decreaseQuantity(CartItemModel item) {
    final currentItems = [...state];

    final index = currentItems.indexOf(item);

    if (index != -1) {
      if (currentItems[index].quantity > 1) {
        currentItems[index] = currentItems[index].copyWith(
          quantity: currentItems[index].quantity - 1,
        );
      } else {
        currentItems.removeAt(index);
      }

      state = currentItems;
    }
  }

  // حذف جميع المنتجات
  void clearCart() {
    state = [];
  }

  // إجمالي السعر
  double get totalPrice {
    return state.fold(
      0,
      (total, item) => total + item.totalPrice,
    );
  }

  // عدد المنتجات في السلة
  int get totalItems {
    return state.fold(
      0,
      (total, item) => total + item.quantity,
    );
  }
}