/// File: account.dart
/// Project: mobile
/// Created Date: Tuesday, June 29th 2021, 4:29:56 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Tuesday, June 29th 2021 4:52:18 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/features/account/domain/repositories/account.dart';
import 'package:mobile/features/shared/domain/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:twitter_login/twitter_login.dart';

/// implementation of the [BaseAccountRepository]
class AccountRepository extends BaseAccountRepository {
  final BaseNetworkInfo networkInfo;
  final GoogleSignIn googleSignIn;
  final FacebookLogin facebookLogin;
  final TwitterLogin twitterLogin;

  AccountRepository({
    required this.networkInfo,
    required this.googleSignIn,
    required this.facebookLogin,
    required this.twitterLogin,
  });

  @override
  Future<BaseAccount?> createAccount(
      {required String username,
      required String password,
      required String firstName,
      required String lastName,
      required AccountType accountType}) async {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAccount({required String id}) async {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<BaseAccount?> login(
      {required String username, required String password}) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<BaseAccount?> loginWithOAuth({required OAuthType type}) async {
    // TODO: implement loginWithOAuth
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword({required String username}) async {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
