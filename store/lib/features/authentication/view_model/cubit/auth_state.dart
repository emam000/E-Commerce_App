part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

//! Sign Up states ....

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpError extends AuthState {
  final String message;

  SignUpError({required this.message});
}

//! pick Image states ....
class PickImageLoading extends AuthState {}

class PickImageSuccess extends AuthState {}

class PickImageError extends AuthState {
  final String message;

  PickImageError({required this.message});
}

//! sign In states ...

class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {
  final String message;

  SignInSuccess({required this.message});
}

class SignInError extends AuthState {
  final String message;

  SignInError({required this.message});
}

class UncompleteSigninWithGoogle extends AuthState {}

class SigninWithGoogleLoading extends AuthState {}

class SigninWithGoogleSuccess extends AuthState {}

class SigninWithGoogleError extends AuthState {
  final String message;

  SigninWithGoogleError({required this.message});
}

class LogoutSuccess extends AuthState {}

class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {}

class ResetPasswordError extends AuthState {
  final String message;

  ResetPasswordError({required this.message});
}
