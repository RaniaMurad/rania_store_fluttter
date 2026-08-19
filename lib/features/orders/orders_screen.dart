import 'package:flutter/material.dart';
import 'package:rania_store/core/theme/app_colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.background,

        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,

          title: const Text(
            'طلباتي',
            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        body: ListView(
          padding: const EdgeInsets.all(20),

          children: const [
            OrderCard(
              orderNumber: '#1001',
              date: '20 يوليو 2026',
              status: 'تم التوصيل',
              statusColor: Colors.green,
              total: 120.00,
            ),

            OrderCard(
              orderNumber: '#1002',
              date: '22 يوليو 2026',
              status: 'قيد التجهيز',
              statusColor: Colors.orange,
              total: 85.50,
            ),

            OrderCard(
              orderNumber: '#1003',
              date: '25 يوليو 2026',
              status: 'قيد الشحن',
              statusColor: Colors.blue,
              total: 250.00,
            ),
          ],
        ),
      
    );
  }
}

// =====================================================
// ORDER CARD
// =====================================================

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String status;
  final Color statusColor;
  final double total;

  const OrderCard({
    super.key,
    required this.orderNumber,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.fieldFill,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: AppColors.fieldBorder),
      ),

      child: Column(
        children: [
          // ================= ORDER HEADER =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'طلب $orderNumber',

                style: const TextStyle(
                  color: AppColors.textDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),

                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  status,

                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ================= DATE =================
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: AppColors.textGray,
              ),

              const SizedBox(width: 8),

              Text(
                date,

                style: const TextStyle(color: AppColors.textGray, fontSize: 13),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Divider(color: AppColors.fieldBorder),

          // ================= TOTAL =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                'الإجمالي',

                style: TextStyle(color: AppColors.textGray),
              ),

              Text(
                '\$${total.toStringAsFixed(2)}',

                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ================= DETAILS BUTTON =================
          SizedBox(
            width: double.infinity,

            child: OutlinedButton(
              onPressed: () {},

              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

              child: const Text(
                'عرض تفاصيل الطلب',

                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
