import 'package:flutter/material.dart';
import 'package:rania_store/features/auth/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            child: Form(
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Back",
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
                                colors: [Color(0xffF4D197), Color(0xffC89A55)],
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
                        "Create Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Create your account and enjoy\nan elegant shopping experience.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 45),
                      const Text(
                        "First Name",
                        style: TextStyle(
                          color: Color(0xffD4AF37),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      CustomTextField(
                        label: "Enter your first name",
                        icon: Icons.person_outline,
                        controller: firstNameController,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Last Name",
                        style: TextStyle(
                          color: Color(0xffD4AF37),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      CustomTextField(
                        label: "Enter your last name",
                        icon: Icons.badge_outlined,
                        controller: lastNameController,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Username",
                        style: TextStyle(
                          color: Color(0xffD4AF37),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      CustomTextField(
                        label: "Choose a username",
                        icon: Icons.alternate_email,
                        controller: usernameController,
                      ),

                      const SizedBox(height: 20),

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
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),

                      const SizedBox(height: 20),

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
                        isPassword: true,
                        controller: passwordController,
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Confirm Password",
                        style: TextStyle(
                          color: Color(0xffD4AF37),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      CustomTextField(
                        label: "Confirm your password",
                        icon: Icons.lock_reset_outlined,
                        isPassword: true,
                        controller: confirmPasswordController,
                      ),

                      const SizedBox(height: 35),

                      //====================== Create Account Button ======================
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Sign Up
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffD4AF37),
                            foregroundColor: Colors.black,
                            elevation: 12,
                            shadowColor: const Color(0xffC89A55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Create Account",
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

                      //====================== Google ======================
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

                      //====================== Login ======================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Sign In",
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
            ),
          ),
        ),
      
    );
  }
}
