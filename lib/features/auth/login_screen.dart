import 'package:flutter/material.dart';
import 'package:rania_store/core/theme/app_colors.dart';
import 'package:rania_store/features/auth/signup_screen.dart';
import 'package:rania_store/features/auth/widgets/custom_text_field.dart';
import 'package:rania_store/features/auth/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // اللوجو
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'RANIA\n',
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              height: 1.1,
                            ),
                          ),
                          TextSpan(
                            text: 'STORE',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // الترحيب
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'مرحباً بعودتك',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.favorite, color: AppColors.heart, size: 20),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'سجل دخولك للمتابعة',
                  style: TextStyle(color: AppColors.textGray, fontSize: 14),
                ),

                const SizedBox(height: 32),

                // الحقول
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

                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(color: AppColors.primary, fontSize: 13),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                PrimaryButton(text: 'تسجيل الدخول', onPressed: () {}),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.fieldBorder)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'أو',
                        style: TextStyle(color: AppColors.textGray),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.fieldBorder)),
                  ],
                ),

                const SizedBox(height: 20),

                // زر جوجل
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.fieldFill,
                      side: BorderSide(color: AppColors.fieldBorder),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    icon: const Icon(
                      Icons.g_mobiledata,
                      color: Colors.red,
                      size: 28,
                    ),
                    label: const Text(
                      'تسجيل الدخول باستخدام Google',
                      style: TextStyle(color: AppColors.textDark, fontSize: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ليس لديك حساب؟',
                      style: TextStyle(color: AppColors.textGray),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'إنشاء حساب',
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
      
    );
  }
}
