import 'package:flutter/material.dart';
import 'package:rania_store/core/theme/app_colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'إلكترونيات', 'icon': Icons.devices_outlined},
      {'name': 'أزياء', 'icon': Icons.checkroom_outlined},
      {'name': 'حقائب', 'icon': Icons.shopping_bag_outlined},
      {'name': 'أحذية', 'icon': Icons.stairs_outlined},
    ];

    return  Scaffold(
        backgroundColor: AppColors.background,

        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,

          centerTitle: true,

          title: const Text(
            'التصنيفات',

            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'تصفح حسب التصنيف',

                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // التصنيفات
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    crossAxisSpacing: 14,

                    mainAxisSpacing: 14,

                    childAspectRatio: 1.25,
                  ),

                  itemBuilder: (context, index) {
                    final category = categories[index];

                    return GestureDetector(
                      onTap: () {
                        // لاحقًا نفتح المنتجات الخاصة بالتصنيف
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.fieldFill,

                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(color: AppColors.primary),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Container(
                              padding: const EdgeInsets.all(18),

                              decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                color: AppColors.background,

                                border: Border.all(color: AppColors.primary),
                              ),

                              child: Icon(
                                category['icon'] as IconData,

                                color: AppColors.primary,

                                size: 36,
                              ),
                            ),

                            const SizedBox(height: 14),

                            Text(
                              category['name'] as String,

                              style: const TextStyle(
                                color: AppColors.textDark,

                                fontSize: 16,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
