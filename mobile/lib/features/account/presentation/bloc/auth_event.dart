part of 'auth_bloc.dart';

abstract class AuthEvent {
  late AccountType accountType;
}

class LoginWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  final AccountType accountType;

  LoginWithEmailAndPasswordEvent(
      {required this.email, required this.password, required this.accountType});
}

class LoginWithGoogleEvent extends AuthEvent {
  final AccountType accountType;

  LoginWithGoogleEvent(this.accountType);
}

class LoginWithFacebookEvent extends AuthEvent {
  final AccountType accountType;

  LoginWithFacebookEvent(this.accountType);
}

class LoginWithTwitterEvent extends AuthEvent {
  final AccountType accountType;

  LoginWithTwitterEvent(this.accountType);
}

class LoginWithAppleEvent extends AuthEvent {
  final AccountType accountType;

  LoginWithAppleEvent(this.accountType);
}
