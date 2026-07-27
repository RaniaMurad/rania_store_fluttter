import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rania_store/core/di/dependency_injection.dart';

import 'package:rania_store/features/auth/logic/cubit/auth_cubit.dart';
import 'package:rania_store/features/auth/logic/cubit/auth_state.dart';
import 'package:rania_store/features/auth/signup_screen.dart';
import 'package:rania_store/features/auth/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        username: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff1B1B1B), Color(0xff121212), Colors.black],
            ),
          ),
          child: SafeArea(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (token) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green.shade700,
                        content: const Text("Login Successfully"),
                      ),
                    );

                    // TODO
                    // Navigator.pushReplacement(...)
                  },

                  failure: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red.shade700,
                        content: Text(message),
                      ),
                    );
                  },
                );
              },

              builder: (context, state) {
                final bool isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );

                return Form(
                  key: _formKey,

                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 25),

                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 900),

                      tween: Tween(begin: 0, end: 1),

                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,

                          child: Transform.translate(
                            offset: Offset(0, 35 * (1 - value)),

                            child: child,
                          ),
                        );
                      },

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,

                        children: [
                          const SizedBox(height: 25),

                          Align(
                            alignment: Alignment.centerLeft,

                            child: TextButton(
                              onPressed: () {},

                              child: const Text(
                                "Skip",

                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Hero(
                            tag: "logo",

                            child: Center(
                              child: Container(
                                width: 120,
                                height: 120,

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,

                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xffF4D197),
                                      Color(0xffC89A55),
                                    ],
                                  ),

                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0xffC89A55),
                                      blurRadius: 30,
                                    ),
                                  ],
                                ),

                                child: const Center(
                                  child: Text(
                                    "R",

                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          const Text(
                            "Welcome Back",

                            textAlign: TextAlign.center,

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Sign in to continue your\nluxury shopping experience.",

                            textAlign: TextAlign.center,

                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 15,
                              height: 1.6,
                            ),
                          ),

                          const SizedBox(height: 45),

                          //====================== Email ======================
                          const Text(
                            "Email",
                            style: TextStyle(
                              color: Color(0xffD4AF37),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 10),

                          CustomTextField(
                            label: "Enter your email",
                            icon: Icons.email_outlined,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter your email";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 22),

                          //====================== Password ======================
                          const Text(
                            "Password",
                            style: TextStyle(
                              color: Color(0xffD4AF37),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(height: 10),

                          CustomTextField(
                            label: "Enter your password",
                            icon: Icons.lock_outline,
                            controller: _passwordController,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Color(0xffD4AF37),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          //====================== Login Button ======================
                          SizedBox(
                            width: double.infinity,
                            height: 58,
                            child: ElevatedButton(
                              onPressed: isLoading ? null : _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffD4AF37),
                                foregroundColor: Colors.black,
                                elevation: 12,
                                shadowColor: const Color(0xffC89A55),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: isLoading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        color: Colors.black,
                                      ),
                                    )
                                  : const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Sign In",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(Icons.arrow_forward_rounded),
                                      ],
                                    ),
                            ),
                          ),

                          const SizedBox(height: 35),

                          //====================== Divider ======================
                          const Row(
                            children: [
                              Expanded(child: Divider(color: Colors.white24)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(child: Divider(color: Colors.white24)),
                            ],
                          ),

                          const SizedBox(height: 30),

                          //====================== Google Button ======================
                          SizedBox(
                            height: 58,
                            child: OutlinedButton.icon(
                              onPressed: () {},

                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),

                              icon: const Icon(
                                Icons.g_mobiledata,
                                size: 34,
                                color: Colors.white,
                              ),

                              label: const Text(
                                "Continue with Google",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 15,
                                ),
                              ),

                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignupScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Color(0xffD4AF37),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
