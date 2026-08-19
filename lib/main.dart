import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rania_store/core/di/dependency_injection.dart';
//import 'package:rania_store/features/home/home_screen.dart';
import 'package:rania_store/features/home/home_screen_new2.dart';

import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();

  runApp(
    const ProviderScope(
      child: RaniaStoreApp(),
    ),
  );
}

class RaniaStoreApp extends StatelessWidget {
  const RaniaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rania Store',
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}