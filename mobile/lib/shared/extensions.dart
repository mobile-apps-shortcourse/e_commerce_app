/// Filename: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile\lib\shared\extensions.dart
/// Path: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile
/// Created Date: Thursday, July 15th 2021, 9:56:10 am
/// Author: Short Course May-July, 2021
///
/// Copyright (c) 2021 University of Ghana

part of 'shared.dart';

// 'dennis'.text() => Text('dennis')
extension StringX on String {
  // sets first character in a string as uppercase
  String capitalize() => '${substring(0, 1).toUpperCase()}${substring(1)}';

  Widget text({
    Color? color,
    FontWeight? fontWeight,
    double opacity = 1.0,
    TextAlign? align,
    double? size,
  }) =>
      Text(
        this,
        style: TextStyle(
          color: (color ?? DeviceConfig.kColorScheme.onBackground)
              .withOpacity(opacity),
          fontWeight: fontWeight,
          fontSize: size,
        ),
        textAlign: align,
      );

  Widget h1({
    Color? color,
    FontWeight? fontWeight,
    double opacity = 1.0,
    TextAlign? align,
    double? size,
  }) =>
      Text(
        this,
        style: DeviceConfig.kTextTheme.headline1?.copyWith(
          color: (color ?? DeviceConfig.kColorScheme.onBackground)
              .withOpacity(opacity),
          fontWeight: fontWeight,
          fontSize: size,
        ),
        textAlign: align,
      );

  Widget h2({
    Color? color,
    FontWeight? fontWeight,
    double opacity = 1.0,
    TextAlign? align,
    double? size,
  }) =>
      Text(
        this,
        style: DeviceConfig.kTextTheme.headline2?.copyWith(
          color: (color ?? DeviceConfig.kColorScheme.onBackground)
              .withOpacity(opacity),
          fontWeight: fontWeight,
          fontSize: size,
        ),
        textAlign: align,
      );

  Widget h3({
    Color? color,
    FontWeight? fontWeight,
    double opacity = 1.0,
    TextAlign? align,
    double? size,
  }) =>
      Text(
        this,
        style: DeviceConfig.kTextTheme.headline3?.copyWith(
          color: (color ?? DeviceConfig.kColorScheme.onBackground)
              .withOpacity(opacity),
          fontWeight: fontWeight,
          fontSize: size,
        ),
        textAlign: align,
      );

  Widget h4({
    Color? color,
    FontWeight? fontWeight,
    double opacity = 1.0,
    TextAlign? align,
    double? size,
  }) =>
      Text(
        this,
        style: DeviceConfig.kTextTheme.headline4?.copyWith(
          color: (color ?? DeviceConfig.kColorScheme.onBackground)
              .withOpacity(opacity),
          fontWeight: fontWeight,
          fontSize: size,
        ),
        textAlign: align,
      );

  Widget h5({
    Color? color,
    FontWeight? fontWeight,
    double opacity = 1.0,
    TextAlign? align,
    double? size,
  }) =>
      Text(
        this,
        style: DeviceConfig.kTextTheme.headline5?.copyWith(
          color: (color ?? DeviceConfig.kColorScheme.onBackground)
              .withOpacity(opacity),
          fontWeight: fontWeight,
          fontSize: size,
        ),
        textAlign: align,
      );

  Widget h6({
    Color? color,
    FontWeight? fontWeight,
    double opacity = 1.0,
    TextAlign? align,
    double? size,
  }) =>
      Text(
        this,
        style: DeviceConfig.kTextTheme.headline6?.copyWith(
          color: (color ?? DeviceConfig.kColorScheme.onBackground)
              .withOpacity(opacity),
          fontWeight: fontWeight,
          fontSize: size,
        ),
        textAlign: align,
      );

  Widget bodyText1({
    Color? color,
    FontWeight? fontWeight,
    double opacity = 1.0,
    TextAlign? align,
    double? size,
  }) =>
      Text(
        this,
        style: DeviceConfig.kTextTheme.bodyText1?.copyWith(
          color: (color ?? DeviceConfig.kColorScheme.onBackground)
              .withOpacity(opacity),
          fontWeight: fontWeight,
          fontSize: size,
        ),
        textAlign: align,
      );

  Widget bodyText2({
    Color? color,
    FontWeight? fontWeight,
    double opacity = 1.0,
    TextAlign? align,
    double? size,
  }) =>
      Text(
        this,
        style: DeviceConfig.kTextTheme.bodyText2?.copyWith(
          color: (color ?? DeviceConfig.kColorScheme.onBackground)
              .withOpacity(opacity),
          fontWeight: fontWeight,
          fontSize: size,
        ),
        textAlign: align,
      );
}

extension WidgetX on Widget {
  Widget right(double spacing) => Padding(
        padding: EdgeInsets.only(right: spacing),
        child: this,
      );

  Widget left(double spacing) => Padding(
        padding: EdgeInsets.only(left: spacing),
        child: this,
      );

  Widget top(double spacing) => Padding(
        padding: EdgeInsets.only(top: spacing),
        child: this,
      );

  Widget bottom(double spacing) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: this,
      );

  Widget vertical(double spacing) => Padding(
        padding: EdgeInsets.symmetric(vertical: spacing),
        child: this,
      );

  Widget horizontal(double spacing) => Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: this,
      );
}

extension ContextX on BuildContext {
  void showSnackBar({required String message}) => ScaffoldMessenger.of(this)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content:
            message.bodyText2(color: DeviceConfig.kColorScheme.onPrimary)));
}
