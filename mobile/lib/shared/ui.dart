/// File: ui.dart
/// Project: mobile
/// Created Date: Thursday, June 10th 2021, 10:47:59 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 24th 2021 2:37:53 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// color scheme
final kPrimaryColor = Color(0xff000000);
final kPrimaryVariantColor = Color(0xff000000);
final kOnPrimaryColor = Color(0xffffffff);
final kSecondaryColor = Color(0xff000000);
final kSecondaryVariantColor = Color(0xff000000);
final kOnSecondaryColor = Color(0xffffffff);
final kErrorColor = Color(0xffb00020);
final kOnErrorColor = Color(0xffffffff);
final kBackgroundColor = Color(0xffffffff);
final kOnBackgroundColor = Color(0xff000000);
final kSurfaceColor = Color(0xffefefef);
final kOnSurfaceColor = Color(0xff000000);

// text theme
final _primaryFont = GoogleFonts.montserrat;
final _secondaryFont = GoogleFonts.rubik;
TextTheme kDefaultTextTheme(BuildContext context) {
  var kColorScheme = Theme.of(context).colorScheme;

  return TextTheme(
    headline1: _primaryFont(
        color: kColorScheme.onBackground,
        fontSize: 97,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5),
    headline2: _primaryFont(
        color: kColorScheme.onBackground,
        fontSize: 61,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5),
    headline3: _primaryFont(
        color: kColorScheme.onBackground,
        fontSize: 48,
        fontWeight: FontWeight.w400),
    headline4: _primaryFont(
        color: kColorScheme.onBackground,
        fontSize: 34,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25),
    headline5: _primaryFont(
        color: kColorScheme.onBackground,
        fontSize: 24,
        fontWeight: FontWeight.w400),
    headline6: _primaryFont(
        color: kColorScheme.onBackground,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15),
    subtitle1: _primaryFont(
        color: kColorScheme.onBackground,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15),
    subtitle2: _primaryFont(
        color: kColorScheme.onBackground,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1),
    bodyText1: _primaryFont(
        color: kColorScheme.onBackground,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5),
    bodyText2: _secondaryFont(
        color: kColorScheme.onBackground,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25),
    button: _secondaryFont(
        color: kColorScheme.onBackground,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25),
    caption: _secondaryFont(
        color: kColorScheme.onBackground,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4),
    overline: _secondaryFont(
        color: kColorScheme.onBackground,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5),
  );
}
