import 'package:dio/dio.dart';
import 'package:rania_store/core/network/api_result.dart';
import 'package:rania_store/core/network/api_service.dart';
import 'package:rania_store/features/auth/data/models/login_request.dart';
import 'package:rania_store/features/auth/data/models/login_respones.dart';

class AuthRepo {
  final ApiService apiService;

  AuthRepo({required this.apiService});

  Future<ApiResult<LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await apiService.login(request);

      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(
        e.response?.data.toString() ?? e.message ?? "Something went wrong",
      );
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
