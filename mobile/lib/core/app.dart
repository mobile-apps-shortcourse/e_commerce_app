/// File: app.dart
/// Project: mobile
/// Created Date: Wednesday, June 9th 2021, 10:05:14 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 24th 2021 1:26:39 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/routes/route.gr.dart';
import 'package:mobile/shared/ui.dart';

class ECommerceApp extends StatelessWidget {
  ECommerceApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // this builds the application itself
    // it needs to know about your routes, themes etc.
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
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
        dialogTheme: DialogTheme(
          backgroundColor: kBackgroundColor,
          titleTextStyle: kDefaultTextTheme(context)
              .bodyText1
              ?.copyWith(color: kOnBackgroundColor),
          contentTextStyle: kDefaultTextTheme(context)
              .bodyText2
              ?.copyWith(color: kOnBackgroundColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
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
    );
  }
}
