import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = Loading;

  const factory AuthState.success(String token) = Success;

  const factory AuthState.failure(String message) = Failure;
}
