
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/favorite/logic/providers/favorite_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,

        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,

          title: const Text(
            'المفضلة',
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),

        body: favorites.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 80,
                      color: AppColors.primary,
                    ),

                    SizedBox(height: 16),

                    Text(
                      'لا توجد منتجات في المفضلة',
                      style: TextStyle(
                        color: AppColors.textGray,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(20),

                itemCount: favorites.length,

                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.65,
                ),

                itemBuilder: (context, index) {
                  final product = favorites[index];

                  return Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: AppColors.fieldFill,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.fieldBorder,
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Center(
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.contain,

                                  errorBuilder: (_, __, ___) {
                                    return const Icon(
                                      Icons.image_not_supported_outlined,
                                      color: AppColors.textGray,
                                      size: 40,
                                    );
                                  },
                                ),
                              ),

                              Positioned(
                                top: 0,
                                right: 0,

                                child: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(favoriteProvider.notifier)
                                        .removeFavorite(product);
                                  },

                                  icon: const Icon(
                                    Icons.favorite,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          product.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,

                          style: const TextStyle(
                            color: AppColors.textDark,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          '\$${product.price.toStringAsFixed(2)}',

                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}