/// File: account.dart
/// Project: mobile
/// Created Date: Tuesday, June 29th 2021, 4:29:56 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, July 1st 2021 11:22:12 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/features/account/data/models/account/account.dart';
import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/features/account/domain/repositories/account.dart';
import 'package:mobile/features/shared/domain/local.storage.dart';
import 'package:mobile/features/shared/domain/network.dart';
import 'package:mobile/shared/logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/twitter_login.dart';

/// implementation of the [BaseAccountRepository]
class AccountRepository extends BaseAccountRepository {
  final BaseNetworkInfo networkInfo;
  final GoogleSignIn googleSignIn;
  final FacebookLogin facebookLogin;
  final TwitterLogin twitterLogin;
  final SignInWithApple signInWithApple;
  final BaseLocalStorage localStorage;

  AccountRepository({
    required this.networkInfo,
    required this.googleSignIn,
    required this.facebookLogin,
    required this.twitterLogin,
    required this.signInWithApple,
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
      case OAuthType.apple:
        return _handleAppleAuth(type: accountType);
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
  Future<BaseAccount?> _handleFacebookAuth({required AccountType type}) async {
    print('facebook');
    try {
      // Log in
      final res = await facebookLogin.logIn(
        permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email,
        ],
      );

      // Check result status
      switch (res.status) {
        case FacebookLoginStatus.success:
          // Send access token to server for validation and auth
          final FacebookAccessToken? accessToken = res.accessToken;
          print('Access token: ${accessToken?.token}');

          // Get profile data
          final profile = await facebookLogin.getUserProfile();
          if (profile == null) {
            print('user could not be found for facebook auth');
            return null;
          } else {
            var displayName = profile.name;

            print('Hello, $displayName! Your ID: ${profile.userId}');

            // Get user profile image url
            final avatar = await facebookLogin.getProfileImageUrl(width: 100);
            print('Your profile image: $avatar');

            // Get email (since we request email permission)
            final email = await facebookLogin.getUserEmail();
            // But user can decline permission
            if (email != null) print('And your email is $email');

            // create user account
            var account = Account(userId: profile.userId, type: type);

            // save user account details
            localStorage.saveAccount = account;

            // todo -> save user data to database

            return account;
          }
        case FacebookLoginStatus.cancel:
          // User cancel log in
          return null;
        case FacebookLoginStatus.error:
          // Log in failed
          print('Error while log in: ${res.error}');
          return null;
      }
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  // sign in with twitter
  Future<BaseAccount?> _handleTwitterAuth({required AccountType type}) async {
    print('twitter');
    try {
      final authResult = await twitterLogin.login();
      if (authResult.status != null) {
        switch (authResult.status!) {
          case TwitterLoginStatus.loggedIn:
            // success
            var user = authResult.user;
            if (user == null) {
              print('user not found for twitter auth');
              return null;
            } else {
              var displayName = user.name;
              var email = user.email;
              var avatar = user.thumbnailImage;
              var id = user.id.toString();

              // create user account
              var account = Account(userId: id, type: type);

              // save user account details
              localStorage.saveAccount = account;

              // todo -> save user data to database

              return account;
            }
          case TwitterLoginStatus.cancelledByUser:
            // cancel
            return null;
          case TwitterLoginStatus.error:
            // error
            return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  // sign in with apple
  Future<BaseAccount?> _handleAppleAuth({required AccountType type}) async {
    try {
      var credential = await SignInWithApple.getAppleIDCredential(
            scopes: [
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName,
            ],
            webAuthenticationOptions: WebAuthenticationOptions(
              clientId: 'clientId', // todo -> add apple client id
              redirectUri: Uri(
                host: 'shopper-ecommerce.firebaseapp.com',
                path: '/__/auth/handler',
                scheme: 'https',
              ),
            ),
          );
      logger.i(credential);
      return null;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}
