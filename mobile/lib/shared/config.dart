/// Filename: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile\lib\shared\config.dart
/// Path: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile
/// Created Date: Thursday, July 15th 2021, 9:50:36 am
/// Author: Short Course May-July, 2021
///
/// Copyright (c) 2021 University of Ghana

part of 'shared.dart';

class DeviceConfig {
  static late double kDeviceWidth;
  static late double kDeviceHeight;
  static late ThemeData kTheme;
  static late TextTheme kTextTheme;
  static late ColorScheme kColorScheme;

  static void init(BuildContext context) {
    var size = MediaQuery.of(context).size;
    kDeviceHeight = size.height;
    kDeviceWidth = size.width;
    kTheme = Theme.of(context);
    kColorScheme = kTheme.colorScheme;
    kTextTheme = kTheme.textTheme;
  }
}
