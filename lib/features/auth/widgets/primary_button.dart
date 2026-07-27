import 'package:flutter/material.dart';
import 'package:rania_store/core/theme/app_colors.dart';

/// زر رئيسي - نسخة الهوية الذهبية الجديدة
/// filled: true = تعبئة ذهبية كاملة ونص أسود (مثل "Start Shopping" بالتصميم)
/// filled: false = حدود ذهبية فقط ونص ذهبي (مثل "Next" بالتصميم)
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool filled;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.filled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: filled ? Colors.black : AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(
            icon,
            color: filled ? Colors.black : AppColors.primary,
            size: 18,
          ),
        ],
      ],
    );

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: filled
          ? ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: content,
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary, width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: content,
            ),
    );
  }
}
