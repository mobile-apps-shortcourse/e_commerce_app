/// File: account.dart
/// Project: mobile
/// Created Date: Tuesday, June 29th 2021, 4:29:56 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, July 1st 2021 11:22:12 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:mobile/features/account/data/models/account/account.dart';
import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/features/account/domain/repositories/account.dart';
import 'package:mobile/features/shared/domain/local.storage.dart';
import 'package:mobile/features/shared/domain/network.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:twitter_login/twitter_login.dart';

/// implementation of the [BaseAccountRepository]
class AccountRepository extends BaseAccountRepository {
  final BaseNetworkInfo networkInfo;
  final GoogleSignIn googleSignIn;
  final FacebookLogin facebookLogin;
  final TwitterLogin twitterLogin;
  final BaseLocalStorage localStorage;

  AccountRepository({
    required this.networkInfo,
    required this.googleSignIn,
    required this.facebookLogin,
    required this.twitterLogin,
    required this.localStorage,
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
  Future<BaseAccount?> loginWithOAuth(
      {required OAuthType type, required AccountType accountType}) async {
    switch (type) {
      case OAuthType.facebook:
        // handle facebook login
        return _handleFacebookAuth(type: accountType);

      case OAuthType.google:
        // handle google login
        return _handleGoogleAuth(type: accountType);

      case OAuthType.twitter:
        // handle twitter login
        return _handleTwitterAuth(type: accountType);
    }
  }

  @override
  Future<bool> resetPassword({required String username}) async {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  // sign in with google
  Future<BaseAccount?> _handleGoogleAuth({required AccountType type}) async {
    try {
      var googleAccount = await googleSignIn.signIn();
      if (googleAccount != null) {
        var displayName = googleAccount.displayName;
        var id = googleAccount.id;
        var email = googleAccount.email;
        var avatar = googleAccount.photoUrl;

        // create user account
        var account = Account(userId: id, type: type);

        // save user account details
        localStorage.saveAccount = account;

        // todo -> save user data to database

        return account;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  // sign in with facebook
  Future<BaseAccount?> _handleFacebookAuth({required AccountType type}) async {}

  // sign in with twitter
  Future<BaseAccount?> _handleTwitterAuth({required AccountType type}) async {}
}
