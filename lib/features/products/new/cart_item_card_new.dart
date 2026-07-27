import 'package:flutter/material.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/products/new/cart_item_model_new.dart';
import 'package:rania_store/features/products/new/cart_quantity_stepper.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.fieldBorder),
      ),
      child: Row(
        children: [
          // صورة المنتج
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              item.product.image,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.textGray,
                );
              },
            ),
          ),

          const SizedBox(width: 12),

          // معلومات المنتج
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  '\$${item.product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (item.size.isNotEmpty)
                  Text(
                    'مقاس: ${item.size}',
                    style: const TextStyle(
                      color: AppColors.textGray,
                      fontSize: 11,
                    ),
                  ),

                if (item.color.isNotEmpty)
                  Text(
                    'اللون: ${item.color}',
                    style: const TextStyle(
                      color: AppColors.textGray,
                      fontSize: 11,
                    ),
                  ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CartQuantityStepper(
                      quantity: item.quantity,
                      onIncrement: onIncrement,
                      onDecrement: onDecrement,
                    ),

                    const SizedBox(width: 8),

                    IconButton(
                      onPressed: onRemove,
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
