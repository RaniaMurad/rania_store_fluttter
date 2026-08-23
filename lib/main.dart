import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:rania_store/core/di/dependency_injection.dart';
//import 'package:rania_store/features/home/home_screen.dart';
import 'package:rania_store/features/home/home_screen_new2.dart';

import 'core/localization/app_translations.dart';
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
      textDirection: (Get.locale?.languageCode ??'ar' )== 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rania Store',
        theme: AppTheme.lightTheme,
        translations:AppTranslations(),
        locale: const Locale('ar'),
        fallbackLocale: const Locale('en'),
        home: const HomeScreen(),
      ),
    );
  }
}