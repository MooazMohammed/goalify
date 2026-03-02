part of 'auth_state_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess({required this.user});
}

final class AuthFailure extends AuthState {
  final String errMessage;

  AuthFailure({required this.errMessage});
}

final class AuthEmailSent extends AuthState {}

final class AuthPasswordVisibilityChanged extends AuthState {
  final bool isPasswordVisible;

  AuthPasswordVisibilityChanged({required this.isPasswordVisible});
}
