import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rania_store/core/di/dependency_injection.dart';
import 'package:rania_store/features/cart/logic/cubit/cart_cubit.dart';
import 'package:rania_store/features/home/home_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CartCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rania Store',
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}