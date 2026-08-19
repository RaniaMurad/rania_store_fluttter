
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rania_store/core/models/product_model.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/cart/cart_screen_new.dart';
import 'package:rania_store/features/cart/cart_screen_new2.dart';
import 'package:rania_store/features/cart/logic/providers/cart_provider.dart';
import 'package:rania_store/features/products/new/cart_item_model_new.dart';

/// بناء نجوم التقييم
List<Widget> _buildRatingStars(double rating) {
  return List.generate(5, (index) {
    if (index < rating.floor()) {
      return const Icon(
        Icons.star,
        color: AppColors.primary,
        size: 16,
      );
    } else if (index < rating && rating - index >= 0.5) {
      return const Icon(
        Icons.star_half,
        color: AppColors.primary,
        size: 16,
      );
    }

    return const Icon(
      Icons.star_border,
      color: AppColors.primary,
      size: 16,
    );
  });
}

class ProductDetailsScreen extends ConsumerWidget {
  final ProductModel product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
        backgroundColor: AppColors.background,

        body: SafeArea(
          child: Column(
            children: [
              // ================= TOP BAR =================
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
                        color: AppColors.primary,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              // ================= CONTENT =================
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ================= PRODUCT IMAGE =================
                      Container(
                        height: 260,
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.fieldFill,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.fieldBorder,
                          ),
                        ),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) {
                            return const Icon(
                              Icons.image_not_supported_outlined,
                              color: AppColors.textGray,
                              size: 60,
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ================= PRODUCT TITLE =================
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // ================= CATEGORY =================
                      Text(
                        product.category,
                        style: const TextStyle(
                          color: AppColors.textGray,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // ================= RATING =================
                      Row(
                        children: [
                          ..._buildRatingStars(product.rating.rate),

                          const SizedBox(width: 6),

                          Text(
                            '${product.rating.rate} '
                            '(${product.rating.count} تقييم)',
                            style: const TextStyle(
                              color: AppColors.textGray,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // ================= PRICE =================
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // ================= DESCRIPTION =================
                      const Text(
                        'الوصف',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                          fontSize: 17,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        product.description,
                        style: const TextStyle(
                          color: AppColors.textGray,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),

              // ================= BOTTOM BAR =================
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // ================= CART BUTTON =================
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        color: AppColors.fieldFill,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.fieldBorder,
                        ),
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

                    // ================= ADD TO CART =================
                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            final cartItem = CartItemModel(
                              product: product,
                              color: '',
                              size: '',
                              quantity: 1,
                            );

                            ref
                                .read(cartProvider.notifier)
                                .addToCart(cartItem);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'تمت الإضافة إلى السلة',
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'أضف إلى السلة',
                            style: TextStyle(
                              color: Colors.black,
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
      
    );
  }
}