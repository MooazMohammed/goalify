import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goalify/core/errors/auth_exception.dart';
import 'package:goalify/features/auth/data/models/user_model.dart';
import 'package:goalify/features/auth/data/repositories/auth_repository.dart';

part 'auth_state_state.dart';

class AuthStateCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  AuthStateCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial());

  // Sign Up

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      emit(AuthLoading());

      final UserModel user = await _authRepository.signUp(
        email: email,
        password: password,
        name: name,
      );

      emit(AuthSuccess(user: user));
    } on AuthException catch (e) {
      emit(AuthFailure(errMessage: e.message));
    }
  }

  // Sign In

  Future<void> signIn({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      emit(AuthLoading());

      final UserModel user = await _authRepository.signIn(
        email: email,
        password: password,
      );

      emit(AuthSuccess(user: user));
    } on AuthException catch (e) {
      emit(AuthFailure(errMessage: e.message));
    }
  }

  // Sign In With Google

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());

    try {
      final UserModel user = await _authRepository.signInWithGoogle();

      emit(AuthSuccess(user: user));
    } on AuthException catch (e) {
      emit(AuthFailure(errMessage: e.message));
    }
  }

  //  Reset Password

  Future<void> resetPassword({required String email}) async {
    emit(AuthLoading());

    try {
      await _authRepository.resetPassword(email: email);

      emit(AuthEmailSent());
    } on AuthException catch (e) {
      emit(AuthFailure(errMessage: e.message));
    }
  }

  //  Sign Out

  Future<void> signOut() async {
    emit(AuthLoading());

    try {
      await _authRepository.signOut();

      emit(AuthInitial());
    } on AuthException catch (e) {
      emit(AuthFailure(errMessage: e.message));
    }
  }

  // Check Current User

  void checkCurrentUser() {
    final UserModel? user = _authRepository.getCurrentUser();

    if (user != null) {
      emit(AuthSuccess(user: user));
    } else {
      emit(AuthInitial());
    }
  }

  // Toggle Password Visibility

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;

    emit(AuthPasswordVisibilityChanged(isPasswordVisible: _isPasswordVisible));
  }

  // Toggle Confirm Password Visibility

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;

    emit(
      AuthPasswordVisibilityChanged(
        isPasswordVisible: _isConfirmPasswordVisible,
      ),
    );
  }

  // Reset State
  void resetState() {
    emit(AuthInitial());
  }
}
