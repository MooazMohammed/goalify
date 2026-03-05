// auth_repository.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:goalify/core/errors/auth_exception.dart';
import 'package:goalify/features/auth/data/models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  // Sign Up
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();

      final updatedUser = _firebaseAuth.currentUser!;
      return UserModel.fromFirebase(updatedUser);

    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    }
  }

  // Sign In
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel.fromFirebase(userCredential.user!);

    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    }
  }

  // Sign In With Google
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await _googleSignIn.signIn();

      if (googleUser == null) {
        throw const GoogleSignInCancelledException();
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      return UserModel.fromFirebase(userCredential.user!);

    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    } catch (e) {
      throw AuthExceptionHandler.handleException(e);
    }
  }

  // Reset Password
  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    }
  }


  // Sign Out
 
  Future<void> signOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      throw AuthExceptionHandler.handleException(e);
    }
  }

  // Get Current User
  UserModel? getCurrentUser() {
    final firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser == null) return null;

    return UserModel.fromFirebase(firebaseUser);
  }
} 