import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/features/account/domain/repositories/account.dart';
import 'package:mobile/features/shared/presentation/bloc/shared_bloc_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, BlocState> {
  final BaseAccountRepository repository;

  AuthBloc({required this.repository}) : super(BlocState.initialState());

  @override
  Stream<BlocState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginWithGoogleEvent) {
      yield BlocState.loadingState();

      // await Future.delayed(Duration(seconds: 2));

      // login with google
      var account = await repository.loginWithOAuth(
          type: OAuthType.google, accountType: event.accountType);
      if (account == null) {
        yield BlocState.errorState(failure: 'Account was not found');
      } else {
        yield BlocState<BaseAccount>.successState(data: account);
      }
    } else if (event is LoginWithEmailAndPasswordEvent) {
      yield BlocState.loadingState();

      // login with email & password
      var account = await repository.login(
          username: event.email, password: event.password);
      if (account == null) {
        yield BlocState.errorState(failure: 'Account was not found');
      } else {
        yield BlocState<BaseAccount>.successState(data: account);
      }
    } else if (event is LoginWithFacebookEvent) {
      yield BlocState.loadingState();

      // login with facebook
      var account = await repository.loginWithOAuth(
          type: OAuthType.facebook, accountType: event.accountType);

      if (account == null) {
        yield BlocState.errorState(failure: 'Account was not found');
      } else {
        yield BlocState<BaseAccount>.successState(data: account);
      }
    } else if (event is LoginWithTwitterEvent) {
      yield BlocState.loadingState();

      // login with twitter
      var account = await repository.loginWithOAuth(
          type: OAuthType.twitter, accountType: event.accountType);
      if (account == null) {
        yield BlocState.errorState(failure: 'Account was not found');
      } else {
        yield BlocState<BaseAccount>.successState(data: account);
      }
    } else if (event is LoginWithAppleEvent) {
      yield BlocState.loadingState();

      // login with apple
      var account = await repository.loginWithOAuth(
          type: OAuthType.apple, accountType: event.accountType);

      if (account == null) {
        yield BlocState.errorState(failure: 'Account was not found');
      } else {
        yield BlocState<BaseAccount>.successState(data: account);
      }
    }
  }
}
