import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthException implements Exception {
  final String code;
  final String message;

  const AuthException({required this.code, required this.message});

  @override
  String toString() {
    
    return 'AuthException($code): $message';
  }
}

// 1. User Not Found
class UserNotFoundException extends AuthException {
  const UserNotFoundException()
      : super(
          code: 'user-not-found',
          message: 'الإيميل ده مش موجود',
        );
}

// 2. Wrong Password
class WrongPasswordException extends AuthException {
  const WrongPasswordException()
      : super(
          code: 'wrong-password',
          message: 'الباسورد غلط',
        );
}

// 3. Email Already In Use
class EmailAlreadyInUseException extends AuthException {
  const EmailAlreadyInUseException()
      : super(
          code: 'email-already-in-use',
          message: 'الإيميل ده مستخدم بالفعل',
        );
}

// 4. Invalid Email
class InvalidEmailException extends AuthException {
  const InvalidEmailException()
      : super(
          code: 'invalid-email',
          message: 'الإيميل مش صحيح',
        );
}

// 5. Weak Password
class WeakPasswordException extends AuthException {
  const WeakPasswordException()
      : super(
          code: 'weak-password',
          message: 'الباسورد ضعيف، لازم يكون 6 أحرف على الأقل',
        );
}

// 6. Network Failed
class NetworkException extends AuthException {
  const NetworkException()
      : super(
          code: 'network-request-failed',
          message: 'تأكد من الاتصال بالإنترنت',
        );
}

// 7. Too Many Requests
class TooManyRequestsException extends AuthException {
  const TooManyRequestsException()
      : super(
          code: 'too-many-requests',
          message: 'حاولت كتير، استنى شوية وحاول تاني',
        );
}

// 8. Google SignIn Cancelled
class GoogleSignInCancelledException extends AuthException {
  const GoogleSignInCancelledException()
      : super(
          code: 'google-sign-in-cancelled',
          message: 'تم إلغاء تسجيل الدخول بـ Google',
        );
}

// 9. Google SignIn Failed
class GoogleSignInFailedException extends AuthException {
  const GoogleSignInFailedException()
      : super(
          code: 'google-sign-in-failed',
          message: 'حدث خطأ في تسجيل الدخول بـ Google',
        );
}

// 10. Unknown 
class UnknownAuthException extends AuthException {
  const UnknownAuthException()
      : super(
          code: 'unknown',
          message: 'حدث خطأ، حاول مرة تانية',
        );
}

class AuthExceptionHandler {
  static AuthException handleException(dynamic e) {
    

   
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return const UserNotFoundException();

        case 'wrong-password':
          return const WrongPasswordException();

        case 'email-already-in-use':
          return const EmailAlreadyInUseException();

        case 'invalid-email':
          return const InvalidEmailException();

        case 'weak-password':
          return const WeakPasswordException();

        case 'network-request-failed':
          return const NetworkException();

        case 'too-many-requests':
          return const TooManyRequestsException();

        default:
          return const UnknownAuthException();
      }
    }

    // If Error From Google Sign In
    if (e is Exception) {
      final message = e.toString();

      if (message.contains('cancelled')) {
        return const GoogleSignInCancelledException();
      }

      if (message.contains('google')) {
        return const GoogleSignInFailedException();
      }
    }

    // Other Error 
    return const UnknownAuthException();
  }
}
