/// Filename: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile\lib\features\account\presentation\pages\login.dart
/// Path: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile
/// Created Date: Thursday, July 8th 2021, 11:50:07 am
/// Author: Short Course May-July, 2021
///
/// Copyright (c) 2021 University of Ghana
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/features/account/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/bloc/shared_bloc_state.dart';
import 'package:mobile/shared/shared.dart';

/// sign in existing users
class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  AuthenticationPageState createState() => AuthenticationPageState();
}

class AuthenticationPageState extends State<AuthenticationPage> {
  // bloc
  final _accountBloc = AuthBloc(repository: Injector.get());

  // UI
  late ThemeData kTheme;
  late ColorScheme kColorScheme;
  late TextTheme kTextTheme;
  bool _loading = false;
  bool _error = false;

  @override
  void dispose() {
    // close the bloc
    _accountBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    kTheme = Theme.of(context);
    kColorScheme = kTheme.colorScheme;
    kTextTheme = kTheme.textTheme;

    return BlocListener<AuthBloc, BlocState>(
      bloc: _accountBloc,
      listener: (context, state) {
        _loading = state is LoadingState;
        _error = state is ErrorState;
        if (mounted) setState(() {});

        if (state is SuccessState<BaseAccount> && mounted) {
          logger.i('account is -> ${state.data}');
          context.showSnackBar(message: 'Signed in successfully');
          context.router.pushAndPopUntil(HomeRoute(), predicate: (_) => false);
        }

        if (state is ErrorState) {
          context.showSnackBar(message: state.failure.toString());
        }
      },
      child: Scaffold(
        body: _loading
            ? Center(child: CircularProgressIndicator.adaptive())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  children: [
                    //top -> app name
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          kAppName,
                          style: kTextTheme.headline5
                              ?.copyWith(color: kColorScheme.onBackground),
                        ),
                      ),
                    ),

                    // middle -> logo & description
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // logo
                          Image.asset("assets/logo.png"),

                          // slogan
                          Padding(
                            padding: const EdgeInsets.only(top: 48, bottom: 8),
                            child: Text(
                              "Buy & sell anything",
                              style: kTextTheme.headline6
                                  ?.copyWith(color: kColorScheme.onBackground),
                            ),
                          ),

                          // description
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                            textAlign: TextAlign.center,
                            style: kTextTheme.caption?.copyWith(
                                color: kColorScheme.onBackground
                                    .withOpacity(0.65)),
                          ),
                        ],
                      ),
                    ),

                    // bottom -> login buttons
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // google button
                          _AuthButton(
                            background: Colors.white,
                            foreground: Colors.black,
                            label: "Login with Google",
                            icon: FontAwesomeIcons.google,
                            onPressed: () => _accountBloc.add(
                                LoginWithGoogleEvent()),
                          ),

                          // twitter button
                          _AuthButton(
                            background: Color(0xff1DA1F2),
                            foreground: Colors.white,
                            label: "Login with Twitter",
                            icon: FontAwesomeIcons.twitter,
                            onPressed: () => _accountBloc.add(
                                LoginWithTwitterEvent()),
                          ),

                          // facebook button
                          _AuthButton(
                            background: Color(0xff4267B2),
                            foreground: Colors.white,
                            label: "Login with Facebook",
                            icon: FontAwesomeIcons.facebook,
                            onPressed: () => _accountBloc.add(
                                LoginWithFacebookEvent()),
                          ),

                          // apple button
                          _AuthButton(
                            background: Colors.black,
                            foreground: Colors.white,
                            label: "Login with Apple",
                            icon: FontAwesomeIcons.apple,
                            onPressed: () => _accountBloc
                                .add(LoginWithAppleEvent()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  final Color background;
  final Color foreground;
  final String label;
  final IconData icon;
  final Function() onPressed;

  const _AuthButton({
    Key? key,
    required this.background,
    required this.foreground,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kTheme = Theme.of(context);
    var kColorScheme = kTheme.colorScheme;
    var kTextTheme = kTheme.textTheme;

    // width of the device
    var kWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Material(
          elevation: 4,
          color: background,
          type: MaterialType.card,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(48),
          child: Container(
            width: kWidth,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(48),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon
                Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: foreground,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(icon, color: background)),

                // label
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: kTextTheme.button?.copyWith(
                      color: foreground,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
