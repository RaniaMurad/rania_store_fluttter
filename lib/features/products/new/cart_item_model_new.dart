import 'package:rania_store/core/models/product_model.dart';

class CartItemModel {
  final ProductModel product;
  final String color;
  final String size;
  final int quantity;

  CartItemModel({
    required this.product,
    required this.color,
    required this.size,
    this.quantity = 1,
  });

  double get totalPrice => product.price * quantity;

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(
      product: product,
      color: color,
      size: size,
      quantity: quantity ?? this.quantity,
    );
  }
}
