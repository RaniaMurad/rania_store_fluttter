/*import 'package:flutter/material.dart';
import 'package:rania_store/core/models/product_new.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/cart/cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedColor = 0;
  int _selectedSize = 1;
  int _selectedImage = 0;

  final List<Color> _colors = const [
    AppColors.primary,
    Colors.black,
    Color(0xFFE91E8C),
    Color(0xFFD9D9E3),
  ];

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.textDark,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
                        color: AppColors.textDark,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 260,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.fieldFill,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.checkroom,
                          color: AppColors.primary,
                          size: 100,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (i) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: 7,
                            height: 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: i == _selectedImage
                                  ? AppColors.primary
                                  : AppColors.fieldBorder,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${product.rating} (${product.reviews} تقييم)',
                            style: const TextStyle(
                              color: AppColors.textGray,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: List.generate(_colors.length, (i) {
                          final selected = i == _selectedColor;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedColor = i),
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selected
                                      ? AppColors.primary
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: _colors[i],
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'المقاسات',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: List.generate(product.sizes.length, (i) {
                          final selected = i == _selectedSize;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedSize = i),
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              width: 50,
                              height: 44,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: selected
                                    ? AppColors.primary
                                    : AppColors.fieldFill,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: selected
                                      ? AppColors.primary
                                      : AppColors.fieldBorder,
                                ),
                              ),
                              child: Text(
                                product.sizes[i],
                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : AppColors.textDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'الوصف',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.description,
                        style: const TextStyle(
                          color: AppColors.textGray,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        color: AppColors.fieldFill,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppColors.fieldBorder),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CartScreen(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تمت الإضافة إلى السلة'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'أضف إلى السلة',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
