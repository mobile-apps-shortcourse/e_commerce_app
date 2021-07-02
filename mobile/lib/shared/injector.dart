import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:mobile/features/shared/domain/local.storage.dart';
import 'package:mobile/features/shared/domain/network.dart';
import 'package:riverpod/riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile/features/account/data/repositories/account.dart';
import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/features/account/domain/repositories/account.dart';
import 'package:mobile/features/shared/data/local.storage.dart';
import 'package:mobile/features/shared/data/network.dart';
import 'package:mobile/shared/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/twitter_login.dart';

import 'logger.dart';

/// region dependencies
// shared preferences
final _sharedPreferencesProvider = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

// internet connection checker
final _internetConnectionProvider =
    Provider<InternetConnectionChecker>((_) => InternetConnectionChecker());

// network provider
final _networkInfoProvider =
    Provider.family<BaseNetworkInfo, InternetConnectionChecker>(
        (_, checker) => NetworkInfo(checker: checker));

// google sign in
final _googleSignInProvider = Provider<GoogleSignIn>((_) => GoogleSignIn());

// facebook sign in
final _facebookProvider = Provider<FacebookLogin>((_) => FacebookLogin());

// twitter sign in
final _twitterProvider = Provider<TwitterLogin>(
  (_) => TwitterLogin(
    apiKey: 'zCeNFjWom3JgsKIuHFyhjoTrY',
    apiSecretKey: 'Y3H9m9igrpztweA5BrjGRKTcbJS2vVXvUMy6N6KEMQvfbgu2eK',
    redirectURI: 'https://shopper-ecommerce.firebaseapp.com/__/auth/handler',
  ),
);

// apple sign in
final _appleLoginProvider =
    FutureProvider<SignInWithApple>((_) async => await SignInWithApple());

// local storage
final _localStorageProvider =
    Provider.family<BaseLocalStorage, SharedPreferences>(
        (_, prefs) => LocalStorage(prefs: prefs));

/// endregion

// handles dependency injection
class Injector {
  // put all dependencies here
  static final _deps = [];

  // create dependencies
  static Future<void> init() async {
    var provider = ProviderContainer();

    SharedPreferences.setMockInitialValues({});

    // dependencies
    var prefs = await provider.read(_sharedPreferencesProvider.future);
    var checker = provider.read(_internetConnectionProvider);
    var networkInfo = provider.read(_networkInfoProvider(checker));
    var googleSignIn = provider.read(_googleSignInProvider);
    var facebookLogin = provider.read(_facebookProvider);
    var twitterLogin = provider.read(_twitterProvider);
    var signInWithApple = await provider.read(_appleLoginProvider.future);
    var localStorage = provider.read(_localStorageProvider(prefs));

    // repositories
    BaseAccountRepository accountRepo = AccountRepository(
      networkInfo: networkInfo,
      googleSignIn: googleSignIn,
      facebookLogin: facebookLogin,
      twitterLogin: twitterLogin,
      signInWithApple: signInWithApple,
      localStorage: localStorage,
    );

    // add dependencies
    _deps.add(accountRepo);

    logger.i('${_deps.length} dependencies added');
  }

  // returns an instance of the dependency if any
  T get<T>() {
    for (var dep in _deps) {
      if (dep is T) return dep;
    }
    throw Exception('the requested dependency does not exist');
  }
}
