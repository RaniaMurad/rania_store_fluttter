import 'package:rania_store/core/models/product_model.dart';
import 'package:rania_store/core/network/api_result.dart';
import 'package:rania_store/core/network/api_service.dart';

class ProductRepo {
  final ApiService apiService;

  ProductRepo({required this.apiService});

  Future<ApiResult<List<ProductModel>>> getAllProducts() async {
    try {
      final response = await apiService.getAllProducts();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
