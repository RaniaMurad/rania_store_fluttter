import 'package:get_it/get_it.dart';
import 'package:rania_store/core/network/api_service.dart';
import 'package:rania_store/core/network/dio_factory.dart';

import 'package:rania_store/features/auth/data/repo/auth_repo.dart';
import 'package:rania_store/features/auth/logic/cubit/auth_cubit.dart';
//import 'package:rania_store/features/cart/logic/cubit/cart_cubit.dart';
//import 'package:rania_store/features/favorite/logic/cubit/favorite_cubit.dart';
//import 'package:rania_store/features/products/logic/cubit/product_cubit.dart';
import 'package:rania_store/features/products/repos/product_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  getIt.registerLazySingleton(() => DioFactory.getDio());

  // Api Service
  getIt.registerLazySingleton(() => ApiService(getIt()));

  // Repository
  getIt.registerLazySingleton(() => ProductRepo(apiService: getIt()));

  // Cubit
  // getIt.registerFactory(() => ProductCubit(getIt()));

  getIt.registerLazySingleton(() => AuthRepo(apiService: getIt()));

  getIt.registerFactory(() => AuthCubit(getIt()));
  //getIt.registerLazySingleton<CartCubit>(() => CartCubit());
  //getIt.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit());
}
