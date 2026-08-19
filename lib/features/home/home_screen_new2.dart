
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rania_store/core/models/product_model.dart';
import 'package:rania_store/core/theme/app_colors.dart';

//import 'package:rania_store/features/cart/cart_screen_new.dart';
import 'package:rania_store/features/cart/cart_screen_new2.dart';
import 'package:rania_store/features/categories/categories_screen.dart';
import 'package:rania_store/features/favorite/favorite_screen_new.dart';
//import 'package:rania_store/features/favorite/favorites_screen.dart';

import 'package:rania_store/features/favorite/logic/providers/favorite_provider.dart';

import 'package:rania_store/features/products/logic/providers/product_provider.dart';
//import 'package:rania_store/features/products/new/product_details_screen_new.dart';
import 'package:rania_store/features/products/new/product_details_screen_new2.dart';
import 'package:rania_store/features/profile/profile_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(productProvider);

    return const _HomeView();
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  int _navIndex = 0;

  final List<Map<String, dynamic>> categories = const [
    {'label': 'حقائب', 'icon': Icons.shopping_bag_outlined},
    {'label': 'أزياء', 'icon': Icons.checkroom_outlined},
    {'label': 'أحذية', 'icon': Icons.stairs_outlined},
    {'label': 'إلكترونيات', 'icon': Icons.headphones_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.background,

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 12),

                // ================= TOP BAR =================
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none,
                        color: AppColors.textDark,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            border: Border.all(
                              color: AppColors.primary,
                              width: 1,
                            ),
                          ),

                          child: const Center(
                            child: Text(
                              'R',

                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        const Text(
                          'RANIA STORE',

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: AppColors.textDark,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // ================= CART =================
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CartScreen(),
                          ),
                        );
                      },

                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.textDark,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ================= SEARCH =================
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  decoration: BoxDecoration(
                    color: AppColors.fieldFill,

                    borderRadius: BorderRadius.circular(30),

                    border: Border.all(
                      color: AppColors.fieldBorder,
                    ),
                  ),

                  child: const TextField(
                    textAlign: TextAlign.right,

                    style: TextStyle(
                      color: AppColors.textDark,
                    ),

                    decoration: InputDecoration(
                      border: InputBorder.none,

                      hintText: 'ابحث عن منتج...',

                      hintStyle: TextStyle(
                        color: AppColors.textGray,
                      ),

                      suffixIcon: Icon(
                        Icons.search,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ================= OFFER BANNER =================
                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: AppColors.fieldFill,

                    borderRadius: BorderRadius.circular(18),

                    border: Border.all(
                      color: AppColors.primary,
                      width: 1,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      const Text(
                        'خصومات حصرية',

                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        'حتى 50%',

                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),

                        decoration: BoxDecoration(
                          color: AppColors.primary,

                          borderRadius: BorderRadius.circular(30),
                        ),

                        child: const Text(
                          'تسوق الآن',

                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // ================= CATEGORIES =================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      'التصنيفات',

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.textDark,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CategoriesScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        'عرض الكل',

                        style: TextStyle(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: categories.map((category) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            color: AppColors.fieldFill,

                            border: Border.all(
                              color: AppColors.fieldBorder,
                            ),
                          ),

                          child: Icon(
                            category['icon'] as IconData,
                            color: AppColors.primary,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          category['label'] as String,

                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),

                const SizedBox(height: 28),

                // ================= PRODUCTS TITLE =================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      'أفضل المنتجات',

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.textDark,
                      ),
                    ),

                    TextButton(
                      onPressed: () {},

                      child: const Text(
                        'عرض الكل',

                        style: TextStyle(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ================= PRODUCTS =================
                Consumer(
                  builder: (context, ref, child) {
                    final productsState = ref.watch(productProvider);

                    return productsState.when(
                      loading: () {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),

                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },

                      error: (error, stackTrace) {
                        return Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.wifi_off,
                                color: AppColors.textGray,
                              ),

                              const SizedBox(height: 8),

                              const Text(
                                'تعذر تحميل المنتجات',
                              ),

                              TextButton(
                                onPressed: () {
                                  ref.invalidate(productProvider);
                                },

                                child: const Text(
                                  'إعادة المحاولة',
                                ),
                              ),
                            ],
                          ),
                        );
                      },

                      data: (data) {
                        final products = data.take(6).toList();

                        if (products.isEmpty) {
                          return const Center(
                            child: Text(
                              'لا يوجد منتجات حاليًا',
                            ),
                          );
                        }

                        return GridView.builder(
                          shrinkWrap: true,

                          physics:
                              const NeverScrollableScrollPhysics(),

                          itemCount: products.length,

                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,

                            mainAxisSpacing: 12,

                            crossAxisSpacing: 12,

                            childAspectRatio: 0.62,
                          ),

                          itemBuilder: (context, index) {
                            return _ProductCard(
                              product: products[index],
                            );
                          },
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),

        // ================= BOTTOM NAVIGATION =================
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navIndex,

          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const CategoriesScreen(),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const FavoritesScreen(),
                ),
              );
            } else if (index == 3) {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            } else if (index == 4) {
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (_) => const ProfileScreen(),
                ),
              );
            } else {
              setState(() {
                _navIndex = index;
              });
            }
          },

          backgroundColor: AppColors.background,

          selectedItemColor: AppColors.primary,

          unselectedItemColor: AppColors.textGray,

          type: BottomNavigationBarType.fixed,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'الرئيسية',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.apps_outlined),
              label: 'التصنيفات',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'المفضلة',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'السلة',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'الحساب',
            ),
          ],
        ),
      
    );
  }
}

// =====================================================
// PRODUCT CARD
// =====================================================

class _ProductCard extends ConsumerWidget {
  final ProductModel product;

  const _ProductCard({
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);

    final isFavorite = favorites.contains(product);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
              product: product,
            ),
          ),
        );
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(
            children: [
              Container(
                height: 90,

                width: double.infinity,

                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  color: AppColors.fieldFill,

                  borderRadius: BorderRadius.circular(12),

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
                    );
                  },
                ),
              ),

              // ================= FAVORITE BUTTON =================
              Positioned(
                top: 4,

                right: 4,

                child: IconButton(
                  padding: EdgeInsets.zero,

                  constraints: const BoxConstraints(),

                  onPressed: () {
                    ref
                        .read(favoriteProvider.notifier)
                        .toggleFavorite(product);
                  },

                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,

                    size: 20,

                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            product.title,

            maxLines: 1,

            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 2),

          Row(
            children: [
              const Icon(
                Icons.star,
                size: 11,
                color: AppColors.primary,
              ),

              const SizedBox(width: 2),

              Text(
                '${product.rating.rate}',

                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.textGray,
                ),
              ),
            ],
          ),

          Text(
            '\$${product.price.toStringAsFixed(2)}',

            style: const TextStyle(
              fontSize: 12,

              fontWeight: FontWeight.bold,

              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}