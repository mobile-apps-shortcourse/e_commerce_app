/// Filename: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile\lib\shared\injector.dart
/// Path: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile
/// Created Date: Thursday, July 8th 2021, 11:50:07 am
/// Author: Short Course May-July, 2021
///
/// Copyright (c) 2021 University of Ghana

part of 'shared.dart';

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
final _googleSignInProvider = Provider<GoogleSignIn>((_) => GoogleSignIn(
      clientId: /*SystemConfig.getOrNull('google_client_id')*/ '818759490761-664dd80asvvnp5ubc0h225930dua979d.apps.googleusercontent.com',
    ));

// facebook sign in
final _facebookProvider = Provider<FacebookAuth>((_) => FacebookAuth.instance);

// twitter sign in
final _twitterProvider = Provider<TwitterLogin>(
  (_) => TwitterLogin(
    apiKey: /*SystemConfig.getOrNull('twitter_api_key')!*/ 'zCeNFjWom3JgsKIuHFyhjoTrY',
    apiSecretKey: /*SystemConfig.getOrNull('twitter_api_secret')!*/ 'Y3H9m9igrpztweA5BrjGRKTcbJS2vVXvUMy6N6KEMQvfbgu2eK',
    redirectURI: /*SystemConfig.getOrNull('firebase_auth_redirect_uri')!*/ 'https://shopper-ecommerce.firebaseapp.com/__/auth/handler',
  ),
);

// apple sign in
final _appleLoginProvider = Provider<SignInWithApple>((_) => SignInWithApple());

// firebase authentication
final _firebaseAuthProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

// firebase cloud storage
// Shopper Mall -> shopper_mall
final _firebaseStorageProvider = Provider<Reference>((_) =>
    FirebaseStorage.instance.ref(kAppName.toLowerCase().replaceAll(' ', '_')));

// firebase cloud firestore
final _firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((_) => FirebaseFirestore.instance);

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

    // initialize firebase
    await Firebase.initializeApp();

    // dependencies
    var prefs = await provider.read(_sharedPreferencesProvider.future);
    var checker = provider.read(_internetConnectionProvider);
    var networkInfo = provider.read(_networkInfoProvider(checker));
    var googleSignIn = provider.read(_googleSignInProvider);
    var facebookLogin = provider.read(_facebookProvider);
    var firebaseAuth = provider.read(_firebaseAuthProvider);
    var firebaseStorage = provider.read(_firebaseStorageProvider);
    var firebaseFirestore = provider.read(_firebaseFirestoreProvider);
    var twitterLogin = provider.read(_twitterProvider);
    var signInWithApple = provider.read(_appleLoginProvider);
    var localStorage = provider.read(_localStorageProvider(prefs));

    logger.i(localStorage.userAccount);

    // repositories
    BaseAccountRepository accountRepo = AccountRepository(
      networkInfo: networkInfo,
      googleSignIn: googleSignIn,
      facebookLogin: facebookLogin,
      twitterLogin: twitterLogin,
      signInWithApple: signInWithApple,
      localStorage: localStorage,
      auth: firebaseAuth,
    );

    // add dependencies
    _deps.add(accountRepo);

    logger.i('${_deps.length} dependencies added');
  }

  // returns an instance of the dependency if any
  static T get<T>() {
    for (var dep in _deps) {
      if (dep is T) return dep;
    }
    throw Exception('the requested dependency does not exist');
  }
}
