part of 'auth_bloc.dart';

abstract class AuthEvent {
  late AccountType accountType;
}

class LoginWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  LoginWithEmailAndPasswordEvent({required this.email, required this.password});
}

class LoginWithGoogleEvent extends AuthEvent {}

class LoginWithFacebookEvent extends AuthEvent {}

class LoginWithTwitterEvent extends AuthEvent {}

class LoginWithAppleEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class SaveAccountTypeEvent extends AuthEvent {
  final AccountType accountType;

  SaveAccountTypeEvent({required this.accountType});

}
