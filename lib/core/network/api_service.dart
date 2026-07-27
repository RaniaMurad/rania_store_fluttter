import 'package:dio/dio.dart';
import 'package:rania_store/core/network/api_constant.dart';
import 'package:rania_store/features/auth/data/models/login_request.dart';
import 'package:rania_store/features/auth/data/models/login_respones.dart';
import 'package:retrofit/retrofit.dart';

import '../models/product_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // ================= Products =================

  @GET(ApiConstants.products)
  Future<List<ProductModel>> getAllProducts();

  @GET('${ApiConstants.products}/{id}')
  Future<ProductModel> getSingleProduct(@Path('id') int id);

  // ================= Categories =================

  @GET(ApiConstants.categories)
  Future<List<String>> getAllCategories();

  @GET('${ApiConstants.category}/{categoryName}')
  Future<List<ProductModel>> getProductsByCategory(
    @Path('categoryName') String categoryName,
  );

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest request);
}
