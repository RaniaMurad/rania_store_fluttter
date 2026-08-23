import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/core/widgets/app_scaffold.dart';
import 'package:rania_store/features/orders/orders_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'account'.tr,

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // ================= PROFILE HEADER =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: AppColors.fieldFill,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.fieldBorder),
              ),

              child: Column(
                children: [
                  // صورة الحساب
                  Container(
                    width: 90,
                    height: 90,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                      border: Border.all(color: AppColors.primary, width: 3),
                    ),

                    child: const Center(
                      child: Text(
                        'R',

                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Rania',

                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'مرحبًا بك في RANIA STORE',

                    style: TextStyle(color: AppColors.textGray, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ================= ACCOUNT OPTIONS =================
            _ProfileOption(
              icon: Icons.person_outline,
              title: 'edit_Profile'.tr,
              onTap: () {},
            ),

            _ProfileOption(
              icon: Icons.shopping_bag_outlined,
              title: 'my_orders'.tr,
              onTap: () {
                Get.to(() => const OrdersScreen());
              },
            ),

            _ProfileOption(
              icon: Icons.location_on_outlined,
              title: 'addresses'.tr,
              onTap: () {},
            ),

            _ProfileOption(
              icon: Icons.payment_outlined,
              title: 'payment_methods'.tr,
              onTap: () {},
            ),

            _ProfileOption(
              icon: Icons.notifications_none,
              title: 'notifications'.tr,
              onTap: () {},
            ),

            _ProfileOption(
              icon: Icons.settings_outlined,
              title: 'settings'.tr,
              onTap: () {},
            ),

            const SizedBox(height: 12),

            // ================= LOGOUT =================
            _ProfileOption(
              icon: Icons.logout,
              title: 'log_out'.tr,
              iconColor: Colors.redAccent,
              textColor: Colors.redAccent,
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // ================= LOGOUT DIALOG =================

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.background,

          title:  Text(
            'log_out'.tr,
            textAlign: TextAlign.right,

            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),

          content:  Text(
            'are_you_sure_you_want_to_log_out'.tr,
            textAlign: TextAlign.right,

            style: TextStyle(color: AppColors.textGray),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'إلغاء',
                style: TextStyle(color: AppColors.textGray),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(content: Text('logged_out_successfully'.tr)),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),

              child: const Text('خروج', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}

// =====================================================
// PROFILE OPTION
// =====================================================

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: AppColors.fieldFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.fieldBorder),
      ),

      child: ListTile(
        onTap: onTap,

        leading: Icon(
          Icons.arrow_back_ios_new,
          size: 16,
          color: AppColors.textGray,
        ),

        trailing: Icon(icon, color: iconColor ?? AppColors.primary),

        title: Text(
          title,

          style: TextStyle(
            color: textColor ?? AppColors.textDark,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
