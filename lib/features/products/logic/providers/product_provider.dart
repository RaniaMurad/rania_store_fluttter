
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rania_store/core/di/dependency_injection.dart';
import 'package:rania_store/core/models/product_model.dart';
import 'package:rania_store/core/network/api_result.dart';
import 'package:rania_store/features/products/repos/product_repo.dart';

final productRepoProvider = Provider<ProductRepo>((ref) {
  return getIt<ProductRepo>();
});

final productProvider =
    AsyncNotifierProvider<ProductNotifier, List<ProductModel>>(
  ProductNotifier.new,
);

class ProductNotifier extends AsyncNotifier<List<ProductModel>> {
  @override
  Future<List<ProductModel>> build() async {
    return getAllProducts();
  }

  Future<List<ProductModel>> getAllProducts() async {
    final productRepo = ref.read(productRepoProvider);

    final response = await productRepo.getAllProducts();

    return response.when(
      success: (data) => data,
      failure: (error) => throw Exception(error),
    );
  }
}