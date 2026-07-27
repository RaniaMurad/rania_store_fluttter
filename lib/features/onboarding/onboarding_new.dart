import 'package:flutter/material.dart';
import 'package:rania_store/core/helper/images.dart';
import 'package:rania_store/features/auth/login_screen.dart';
import 'package:rania_store/features/onboarding/onbording_model_new.dart';
// تأكد من مطابقة المسار لملف الموديل الفعلي لديك

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> _screens = [
    OnboardingModel(
      image: "assets/images/onbording.png",

      icon: Icons.checkroom_outlined,
      title: 'Discover',
      subtitle: 'Fashion',
      description: 'Explore the newest collections\nfrom top brands.',
    ),
    OnboardingModel(
      image: 'assets/images/onbording2.png',
      icon: Icons.diamond_outlined,
      title: 'Exclusive',
      subtitle: 'Jewelry',
      description: 'Elegant jewelry crafted\nfor every special moment.',
    ),
    OnboardingModel(
      image: 'assets/images/onbording1.png',
      icon: Icons.local_shipping_outlined,
      title: 'Fast & Secure',
      subtitle: 'Shopping',
      description: 'Premium quality with\nfast delivery to your door.',
      isLast: true,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              _screens[_currentIndex].image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: _screens.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingPage(model: _screens[index]);
            },
          ),
          Positioned(
            top: 50,
            right: 24,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFFC5A059),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 24,
            right: 24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_screens.length, (index) {
                    bool isActive = _currentIndex == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      height: 6,
                      width: isActive ? 24 : 8,
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color(0xFFC5A059)
                            : const Color(0xFF333333),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 32),
                if (_currentIndex < _screens.length - 1)
                  OutlinedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      side: const BorderSide(
                        color: Color(0xFFC5A059),
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Next',
                          style: TextStyle(
                            color: Color(0xFFC5A059),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFFC5A059),
                          size: 18,
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD4AF37), Color(0xFFAA7C11)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Start Shopping',
                            style: TextStyle(
                              color: Color(0xFF0D0D0D),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: Color(0xFF0D0D0D),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;
  const OnboardingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.55,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              //   Image.asset(model.image, fit: BoxFit.cover),
              /*  Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Color(0xFF0D0D0D)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),*/
            ],
          ),
        ),
        Expanded(
          child: Transform.translate(
            offset: const Offset(0, -30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D0D0D),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFC5A059),
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      model.icon,
                      color: const Color(0xFFC5A059),
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    model.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    model.subtitle,
                    style: const TextStyle(
                      color: Color(0xFFC5A059),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    model.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
