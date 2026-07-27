/*import 'package:flutter/material.dart';
import 'package:rania_store/core/models/product_model.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/core/theme/text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Product Image
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.network(
                    product.image,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColors.favorite,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Product Info
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.body,
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.star, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        product.rating.rate.toString(),
                        style: TextStyles.subtitle,
                      ),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${product.price}", style: TextStyles.price),

                      CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.primary,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
