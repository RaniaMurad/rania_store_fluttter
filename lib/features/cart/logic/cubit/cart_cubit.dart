/*import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rania_store/features/products/new/cart_item_model_new.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  final List<CartItemModel> cartItems = [];

  // بدل ما نبعت emit(const CartState.updated()) فاضية، بنبعت نسخة
  // جديدة من القايمة مع كل تغيير. ده اللي بيخلي Bloc يفرق فعليًا
  // بين الحالة القديمة والجديدة ويبلّغ الواجهة (BlocBuilder).
  void _emitUpdated() {
    emit(CartState.updated(List.of(cartItems)));
  }

  // إضافة منتج إلى السلة
  void addToCart(CartItemModel item) {
    final existingIndex = cartItems.indexWhere(
      (cartItem) =>
          cartItem.product.id == item.product.id &&
          cartItem.color == item.color &&
          cartItem.size == item.size,
    );

    if (existingIndex != -1) {
      cartItems[existingIndex] = cartItems[existingIndex].copyWith(
        quantity: cartItems[existingIndex].quantity + item.quantity,
      );
    } else {
      cartItems.add(item);
    }

    print('عدد المنتجات في السلة: ${cartItems.length}');

    _emitUpdated();
  }

  // حذف منتج من السلة
  void removeFromCart(CartItemModel item) {
    cartItems.remove(item);

    _emitUpdated();
  }

  // زيادة الكمية
  void increaseQuantity(CartItemModel item) {
    final index = cartItems.indexOf(item);

    if (index != -1) {
      cartItems[index] = cartItems[index].copyWith(
        quantity: cartItems[index].quantity + 1,
      );

      _emitUpdated();
    }
  }

  // تقليل الكمية
  void decreaseQuantity(CartItemModel item) {
    final index = cartItems.indexOf(item);

    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index] = cartItems[index].copyWith(
          quantity: cartItems[index].quantity - 1,
        );
      } else {
        cartItems.removeAt(index);
      }

      _emitUpdated();
    }
  }

  // حذف جميع المنتجات
  void clearCart() {
    cartItems.clear();

    _emitUpdated();
  }

  // إجمالي السعر
  double get totalPrice {
    return cartItems.fold(0, (total, item) => total + item.totalPrice);
  }

  // عدد المنتجات في السلة
  int get totalItems {
    return cartItems.fold(0, (total, item) => total + item.quantity);
  }
}*/
