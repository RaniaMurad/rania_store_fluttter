import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rania_store/core/helper/images.dart';
import 'package:rania_store/features/onboarding/onboarding_new.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fadeAnimation;

  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0B0B0B),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrownd2.jpg"),

            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Hero(
                    tag: "logo",
                    child: Image.asset(
                      Images.splashImage,
                      height: 150,
                      width: double.infinity,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "RANIA",

                    style: TextStyle(
                      color: Color.fromARGB(255, 144, 105, 42),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "STORE",

                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      letterSpacing: 6,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    " Fashion & Jewelry",

                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),

                  const SizedBox(height: 70),

                  SizedBox(
                    width: 220,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),

                      child: const LinearProgressIndicator(
                        minHeight: 4,

                        backgroundColor: Colors.white24,

                        valueColor: AlwaysStoppedAnimation(
                          Color.fromARGB(255, 144, 105, 42),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Loading...",

                    style: TextStyle(color: Colors.white54, letterSpacing: 3),
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
