import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rania_store/core/network/api_result.dart';
import 'package:rania_store/features/auth/data/models/login_request.dart';
import 'package:rania_store/features/auth/data/repo/auth_repo.dart';
import 'package:rania_store/features/auth/logic/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(const AuthState.initial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(const AuthState.loading());

    final result = await authRepo.login(
      LoginRequest(username: username, password: password),
    );

    result.when(
      success: (response) {
        emit(AuthState.success(response.token));
      },
      failure: (message) {
        emit(AuthState.failure(message));
      },
    );
  }
}
