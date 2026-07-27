import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/cart/logic/cubit/cart_cubit.dart';
import 'package:rania_store/features/cart/logic/cubit/cart_state.dart';
import 'package:rania_store/features/payment/payment_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,

        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,

          title: const Text(
            'إتمام الطلب',
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartCubit = context.read<CartCubit>();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // ================= ADDRESS =================
                  const Text(
                    'عنوان التوصيل',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    textAlign: TextAlign.right,

                    decoration: InputDecoration(
                      hintText: 'أدخل عنوان التوصيل',

                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primary,
                      ),

                      filled: true,
                      fillColor: AppColors.fieldFill,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: AppColors.fieldBorder,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ================= ORDER SUMMARY =================
                  const Text(
                    'ملخص الطلب',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: AppColors.fieldFill,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.fieldBorder),
                    ),

                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'عدد المنتجات',
                              style: TextStyle(color: AppColors.textGray),
                            ),

                            Text(
                              '${cartCubit.totalItems}',
                              style: const TextStyle(
                                color: AppColors.textDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            const Text(
                              'الإجمالي',
                              style: TextStyle(color: AppColors.textGray),
                            ),

                            Text(
                              '\$${cartCubit.totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ================= PAYMENT =================
                  const Text(
                    'طريقة الدفع',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: AppColors.fieldFill,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.fieldBorder),
                    ),

                    child: const Row(
                      children: [
                        Icon(Icons.money_outlined, color: AppColors.primary),

                        SizedBox(width: 12),

                        Text(
                          'الدفع عند الاستلام',
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 15,
                          ),
                        ),

                        Spacer(),

                        Icon(Icons.check_circle, color: AppColors.primary),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // ================= GO TO PAYMENT =================
                  SizedBox(
                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PaymentScreen(),
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
                        'الانتقال إلى الدفع',

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
          },
        ),
      ),
    );
  }
}
