import 'package:flutter/material.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/core/widgets/app_scaffold.dart';
import 'package:rania_store/features/orders/orders_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'الحساب',

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
              title: 'تعديل الملف الشخصي',
              onTap: () {},
            ),

            _ProfileOption(
              icon: Icons.shopping_bag_outlined,
              title: 'طلباتي',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrdersScreen()),
                );
              },
            ),

            _ProfileOption(
              icon: Icons.location_on_outlined,
              title: 'العناوين',
              onTap: () {},
            ),

            _ProfileOption(
              icon: Icons.payment_outlined,
              title: 'طرق الدفع',
              onTap: () {},
            ),

            _ProfileOption(
              icon: Icons.notifications_none,
              title: 'الإشعارات',
              onTap: () {},
            ),

            _ProfileOption(
              icon: Icons.settings_outlined,
              title: 'الإعدادات',
              onTap: () {},
            ),

            const SizedBox(height: 12),

            // ================= LOGOUT =================
            _ProfileOption(
              icon: Icons.logout,
              title: 'تسجيل الخروج',
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

          title: const Text(
            'تسجيل الخروج',
            textAlign: TextAlign.right,

            style: TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: const Text(
            'هل أنت متأكد أنك تريد تسجيل الخروج؟',
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
                  const SnackBar(content: Text('تم تسجيل الخروج')),
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
