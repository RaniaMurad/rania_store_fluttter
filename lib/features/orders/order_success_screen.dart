import 'package:flutter/material.dart';
import 'package:rania_store/core/theme/app_colors.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: AppColors.background,

        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  // ================= SUCCESS ICON =================
                  Container(
                    height: 110,
                    width: 110,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withValues(alpha: 0.15),
                    ),

                    child: const Icon(
                      Icons.check_circle_outline,
                      color: AppColors.primary,
                      size: 75,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ================= TITLE =================
                  const Text(
                    'تم تأكيد طلبك بنجاح 🎉',

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ================= DESCRIPTION =================
                  const Text(
                    'شكرًا لتسوقك من Rania Store\n'
                    'سيتم تجهيز طلبك وإرساله قريبًا',

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: AppColors.textGray,
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ================= BACK HOME =================
                  SizedBox(
                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                      child: const Text(
                        'العودة إلى الرئيسية',

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
          ),
        ),
      ),
    );
  }
}
