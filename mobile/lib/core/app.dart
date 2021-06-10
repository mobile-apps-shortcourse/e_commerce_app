/// File: app.dart
/// Project: mobile
/// Created Date: Wednesday, June 9th 2021, 10:05:14 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 10th 2021 12:17:52 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart';
import 'package:mobile/shared/ui.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this builds the application itself
    // it needs to know about your routes, themes etc.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        textTheme: kDefaultTextTheme(context),
      ),
      scrollBehavior: CupertinoScrollBehavior(),
      theme: ThemeData.light().copyWith(
        // textTheme: GoogleFonts.montserratAlternatesTextTheme().copyWith(
        //   bodyText1: GoogleFonts.rubikTextTheme().bodyText1,
        //   bodyText2: GoogleFonts.rubikTextTheme().bodyText2,
        //   subtitle2: GoogleFonts.rubikTextTheme().subtitle2,
        //   button: GoogleFonts.rubikTextTheme().button,
        //   caption: GoogleFonts.rubikTextTheme().caption,
        // ),
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: kDefaultTextTheme(context),
        colorScheme: ColorScheme.light().copyWith(
          background: kBackgroundColor,
          error: kErrorColor,
          primary: kPrimaryColor,
          primaryVariant: kPrimaryVariantColor,
          secondary: kSecondaryColor,
          secondaryVariant: kSecondaryVariantColor,
          surface: kSurfaceColor,
          onBackground: kOnBackgroundColor,
          onPrimary: kOnPrimaryColor,
          onSecondary: kOnSecondaryColor,
          onSurface: kOnSurfaceColor,
          onError: kOnErrorColor,
        ),
        cardTheme: CardTheme(
          color: kSurfaceColor,
          // shape: RoundedRectangleBorder(),
        ),
      ),
      home: WelcomePage(),
    );
  }
}
