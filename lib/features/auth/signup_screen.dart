import 'package:flutter/material.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/auth/widgets/custom_text_field.dart';
import 'package:rania_store/features/auth/widgets/primary_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                const Text(
                  'إنشاء حساب',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'أنشئ حسابك الجديد',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: AppColors.textGray, fontSize: 14),
                ),

                const SizedBox(height: 28),

                CustomTextField(
                  label: 'الاسم الكامل',
                  icon: Icons.person_outline,
                  controller: _nameController,
                ),
                CustomTextField(
                  label: 'البريد الإلكتروني',
                  icon: Icons.email_outlined,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  label: 'كلمة المرور',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  controller: _passwordController,
                ),
                CustomTextField(
                  label: 'تأكيد كلمة المرور',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  controller: _confirmPasswordController,
                ),

                const SizedBox(height: 12),

                PrimaryButton(text: 'إنشاء حساب', onPressed: () {}),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'لديك حساب بالفعل؟',
                      style: TextStyle(color: AppColors.textGray),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
