/*class Product {
  final String id;
  final String name;
  final double price;
  final String imageAsset; // مسار صورة أو أيقونة مؤقتة
  final double rating;
  final int reviews;
  final String description;
  final List<String> sizes;
  final int quantity; // للاستخدام بالسلة

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageAsset,
    this.rating = 0,
    this.reviews = 0,
    this.description = '',
    this.sizes = const [],
    this.quantity = 1,
  });

  Product copyWith({int? quantity}) {
    return Product(
      id: id,
      name: name,
      price: price,
      imageAsset: imageAsset,
      rating: rating,
      reviews: reviews,
      description: description,
      sizes: sizes,
      quantity: quantity ?? this.quantity,
    );
  }
}*/
