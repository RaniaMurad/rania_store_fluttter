import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/cart/logic/providers/cart_provider.dart';
import 'package:rania_store/features/orders/order_success_screen.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    // نراقب بيانات السلة الحالية
    final cartNotifier = ref.watch(cartProvider.notifier);

    final totalPrice = cartNotifier.totalPrice;
    final totalItems = cartNotifier.totalItems;

    return  Scaffold(
        backgroundColor: AppColors.background,

        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,

          title: const Text(
            'الدفع',
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // ================= PAYMENT METHODS =================
              const Text(
                'اختر طريقة الدفع',

                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // الدفع عند الاستلام
              _PaymentOption(
                title: 'الدفع عند الاستلام',
                subtitle: 'ادفع عند وصول الطلب',
                icon: Icons.money_outlined,
                isSelected: selectedPayment == 0,

                onTap: () {
                  setState(() {
                    selectedPayment = 0;
                  });
                },
              ),

              const SizedBox(height: 12),

              // البطاقة البنكية
              _PaymentOption(
                title: 'بطاقة بنكية',
                subtitle: 'Visa / Mastercard',
                icon: Icons.credit_card_outlined,
                isSelected: selectedPayment == 1,

                onTap: () {
                  setState(() {
                    selectedPayment = 1;
                  });
                },
              ),

              const SizedBox(height: 12),

              // المحفظة الإلكترونية
              _PaymentOption(
                title: 'محفظة إلكترونية',
                subtitle: 'الدفع باستخدام المحفظة',
                icon: Icons.account_balance_wallet_outlined,
                isSelected: selectedPayment == 2,

                onTap: () {
                  setState(() {
                    selectedPayment = 2;
                  });
                },
              ),

              const SizedBox(height: 32),

              // ================= ORDER SUMMARY =================
              const Text(
                'ملخص الدفع',

                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: AppColors.fieldFill,

                  borderRadius: BorderRadius.circular(18),

                  border: Border.all(
                    color: AppColors.fieldBorder,
                  ),
                ),

                child: Column(
                  children: [
                    // عدد المنتجات
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [
                        const Text(
                          'عدد المنتجات',

                          style: TextStyle(
                            color: AppColors.textGray,
                          ),
                        ),

                        Text(
                          '$totalItems',

                          style: const TextStyle(
                            color: AppColors.textDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // الإجمالي
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [
                        const Text(
                          'الإجمالي',

                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 16,
                          ),
                        ),

                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',

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

              const SizedBox(height: 32),

              // ================= CONFIRM PAYMENT =================
              SizedBox(
                width: double.infinity,
                height: 54,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            const OrderSuccessScreen(),
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
                    'تأكيد الدفع',

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
        ),
      
    );
  }
}

// =====================================================
// PAYMENT OPTION
// =====================================================

class _PaymentOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: AppColors.fieldFill,

          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.fieldBorder,

            width: isSelected ? 2 : 1,
          ),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: 28,
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,

                    style: const TextStyle(
                      color: AppColors.textGray,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,

              color: isSelected
                  ? AppColors.primary
                  : AppColors.textGray,
            ),
          ],
        ),
      ),
    );
  }
}