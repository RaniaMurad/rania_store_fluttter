/*import 'package:flutter/material.dart';
import 'package:rania_store/core/models/product_new.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/cart/cart_screen.dart';
import 'package:rania_store/features/favorite/favorites_screen.dart';
import 'package:rania_store/features/products/ui/screens/product_details_screen.dart';
import 'package:rania_store/features/profile/profile_screen.dart';

class HomeeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  final List<Map<String, dynamic>> categories = const [
    {'label': 'حقائب', 'icon': Icons.shopping_bag_outlined},
    {'label': 'أزياء', 'icon': Icons.checkroom_outlined},
    {'label': 'أحذية', 'icon': Icons.stairs_outlined},
    {'label': 'إلكترونيات', 'icon': Icons.headphones_outlined},
  ];

  final List<Product> bestProducts = [
    Product(
      id: '1',
      name: 'ساعة كلاسيكية',
      price: 89.99,
      imageAsset: 'watch',
      rating: 4.7,
    ),
    Product(
      id: '2',
      name: 'هودي بنفسجي كاجوال',
      price: 49.99,
      imageAsset: 'hoodie',
      rating: 4.8,
      reviews: 120,
      description:
          'هودي مصنوع من خامات عالية الجودة يوفر لك الراحة والأناقة في جميع الأوقات.',
      sizes: const ['S', 'M', 'L', 'XL'],
    ),
    Product(
      id: '3',
      name: 'سماعات لاسلكية',
      price: 59.99,
      imageAsset: 'headphones',
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
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
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'RANIA STORE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const CartScreen()),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.textDark,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu, color: AppColors.textDark),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.fieldFill,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.fieldBorder),
                  ),
                  child: const TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'ابحث عن منتج...',
                      hintStyle: TextStyle(color: AppColors.textGray),
                      suffixIcon: Icon(Icons.search, color: AppColors.textGray),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.primaryDark],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'خصومات صيفية',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'حتى 50%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'تسوق الآن',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'التصنيفات',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'عرض الكل',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: categories.map((cat) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: AppColors.fieldFill,
                          child: Icon(
                            cat['icon'] as IconData,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          cat['label'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'أفضل المنتجات',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'عرض الكل',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bestProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final product = bestProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 90,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.fieldFill,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  _iconFor(product.imageAsset),
                                  color: AppColors.primary,
                                  size: 36,
                                ),
                              ),
                              const Positioned(
                                top: 4,
                                right: 4,
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 16,
                                  color: AppColors.textGray,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            product.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 11),
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
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navIndex,
          onTap: (i) {
            setState(() => _navIndex = i);
            if (i == 2) {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(builder: (_) => const FavoritesScreen()),
                  )
                  .then((_) => setState(() => _navIndex = 0));
            } else if (i == 3) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const CartScreen()))
                  .then((_) => setState(() => _navIndex = 0));
            } else if (i == 4) {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  )
                  .then((_) => setState(() => _navIndex = 0));
            }
          },
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
      ),
    );
  }

  IconData _iconFor(String key) {
    switch (key) {
      case 'watch':
        return Icons.watch_outlined;
      case 'hoodie':
        return Icons.checkroom_outlined;
      case 'headphones':
        return Icons.headphones_outlined;
      default:
        return Icons.image_outlined;
    }
  }
}*/
