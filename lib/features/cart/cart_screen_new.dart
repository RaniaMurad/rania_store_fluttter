import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/cart/logic/cubit/cart_cubit.dart';
import 'package:rania_store/features/cart/logic/cubit/cart_state.dart';
import 'package:rania_store/features/products/new/cart_item_card_new.dart';

// أضيفي هذا الاستيراد بعد إنشاء صفحة Checkout
import 'package:rania_store/features/checkout/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartScreenContent();
  }
}

class CartScreenContent extends StatelessWidget {
  const CartScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: AppColors.background,

        // ================= APP BAR =================
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,

          title: const Text(
            'السلة',

            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // ================= BODY =================
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final items = state.maybeWhen(
              updated: (items) => items,
              orElse: () => const [],
            );

            // ================= EMPTY CART =================
            if (items.isEmpty) {
              return const Center(
                child: Text(
                  'السلة فارغة',

                  style: TextStyle(color: AppColors.textGray, fontSize: 16),
                ),
              );
            }

            final cartCubit = context.read<CartCubit>();

            return Column(
              children: [
                // ================= PRODUCTS =================
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),

                    itemCount: items.length,

                    itemBuilder: (context, index) {
                      final item = items[index];

                      return CartItemCard(
                        item: item,

                        onRemove: () {
                          cartCubit.removeFromCart(item);
                        },

                        onIncrement: () {
                          cartCubit.increaseQuantity(item);
                        },

                        onDecrement: () {
                          cartCubit.decreaseQuantity(item);
                        },
                      );
                    },
                  ),
                ),

                // ================= SUMMARY =================
                _buildSummary(context, cartCubit),
              ],
            );
          },
        ),
      ),
    );
  }

  // =====================================================
  // SUMMARY
  // =====================================================

  Widget _buildSummary(BuildContext context, CartCubit cartCubit) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.fieldFill,

        border: const Border(top: BorderSide(color: AppColors.fieldBorder)),
      ),

      child: Column(
        children: [
          // ================= TOTAL =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                'الإجمالي',

                style: TextStyle(color: AppColors.textDark, fontSize: 15),
              ),

              Text(
                '\$${cartCubit.totalPrice.toStringAsFixed(2)}',

                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ================= CHECKOUT BUTTON =================
          SizedBox(
            width: double.infinity,
            height: 52,

            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,

                  MaterialPageRoute(builder: (_) => const CheckoutScreen()),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              child: const Text(
                'إتمام الطلب',

                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
