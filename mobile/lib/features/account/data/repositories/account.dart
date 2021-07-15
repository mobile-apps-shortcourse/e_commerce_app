/// File: account.dart
/// Project: mobile
/// Created Date: Tuesday, June 29th 2021, 4:29:56 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Th/07/yyyy 10:nn:18
/// Modified By: Short Course May-July, 2021
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile/features/account/data/models/account/account.dart';
import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/features/account/domain/repositories/account.dart';
import 'package:mobile/features/shared/domain/local.storage.dart';
import 'package:mobile/features/shared/domain/network.dart';
import 'package:mobile/shared/shared.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/twitter_login.dart';

/// implementation of the [BaseAccountRepository]
class AccountRepository extends BaseAccountRepository {
  final BaseNetworkInfo networkInfo;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookLogin;
  final TwitterLogin twitterLogin;
  final SignInWithApple signInWithApple;
  final BaseLocalStorage localStorage;
  final FirebaseAuth auth;

  AccountRepository({
    required this.networkInfo,
    required this.googleSignIn,
    required this.facebookLogin,
    required this.twitterLogin,
    required this.signInWithApple,
    required this.localStorage,
    required this.auth,
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
    var accountType = localStorage.accountType;
    if (accountType == null) {
      logger.e('no account type selected');
      return null;
    }

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

        // get current authentication
        var authentication = await googleAccount.authentication;

        return _signInWithFirebaseAuth(
            GoogleAuthProvider.credential(
              accessToken: authentication.accessToken,
              idToken: authentication.idToken,
            ),
            type);
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
    try {
      // Log in
      final res = await facebookLogin.login();

      // Check result status
      switch (res.status) {
        case LoginStatus.success:
          // Send access token to server for validation and auth
          final accessToken = res.accessToken;
          if (accessToken != null) {
            // Get profile data
            final profile = await facebookLogin.getUserData();
            var displayName = profile['name'];

            logger.i('Hello, $displayName! Your ID: ${res.accessToken?.token}');

            // Get user profile image url
            final avatar = profile['picture'];
            logger.i('Your profile image: $avatar');

            // Get email (since we request email permission)
            final email = profile['email'];
            // But user can decline permission
            if (email != null) logger.i('And your email is $email');

            return _signInWithFirebaseAuth(
                FacebookAuthProvider.credential(accessToken.token), type);
          } else {
            logger.e('no access token found');
            return null;
          }

        case LoginStatus.cancelled:
          // User cancel log in
          return null;
        case LoginStatus.failed:
          // Log in failed
          logger.i('Error while log in: ${res.message}');
          return null;
        case LoginStatus.operationInProgress:
          // User cancel log in
          break;
      }
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  // sign in with twitter
  Future<BaseAccount?> _handleTwitterAuth({required AccountType type}) async {
    try {
      final authResult = await twitterLogin.login();
      if (authResult.status != null) {
        switch (authResult.status!) {
          case TwitterLoginStatus.loggedIn:
            // success
            var user = authResult.user;
            if (user == null) {
              logger.i('user not found for twitter auth');
              return null;
            } else {
              var displayName = user.name;
              var email = user.email;
              var avatar = user.thumbnailImage;
              var id = user.id.toString();

              return _signInWithFirebaseAuth(
                  TwitterAuthProvider.credential(
                    accessToken: /*SystemConfig.getOrNull('twitter_api_key')!*/ 'zCeNFjWom3JgsKIuHFyhjoTrY',
                    secret: /*SystemConfig.getOrNull('twitter_api_secret')!*/ 'Y3H9m9igrpztweA5BrjGRKTcbJS2vVXvUMy6N6KEMQvfbgu2eK',
                  ),
                  type);
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
      // TODO -> implement apple firebase auth
      // return _signInWithFirebaseAuth(, type);
      return null;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  // signs user in with firebase
  Future<BaseAccount?> _signInWithFirebaseAuth(
      AuthCredential credential, AccountType type) async {
    // sign user in with credentials
    var cred = await auth.signInWithCredential(credential);

    if (cred.user != null) {
      logger.i('logged in with firebase as -> [${cred.user?.uid}]');
      // create user account
      var account = Account(userId: cred.user!.uid, type: type);

      // save user account details
      localStorage.saveAccount = account;

      // save user account type
      localStorage.saveAccountType = type;

      // todo -> save user data to database

      return account;
    }
    return null;
  }

  @override
  bool get isLoggedIn => localStorage.isLoggedIn;

  @override
  Future<void> logout() async {
    // google sign out
    if (googleSignIn.currentUser != null) await googleSignIn.signOut();
    // facebook sign out
    if ((await facebookLogin.accessToken)?.token != null)
      await facebookLogin.logOut();
    await auth.signOut();
  }

  @override
  Future<bool> saveAccountType({required AccountType accountType}) async {
    localStorage.saveAccountType = accountType;
    return localStorage.accountType != null;
  }

  @override
  AccountType? get accountType => localStorage.accountType;
}
