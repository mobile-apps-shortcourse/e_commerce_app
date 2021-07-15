/// Filename: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile\lib\main.dart
/// Path: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile
/// Created Date: Thursday, July 8th 2021, 11:50:07 am
/// Author: Short Course May-July, 2021
///
/// Copyright (c) 2021 University of Ghana
import 'package:configurable/dotenv_configuration_provider.dart';
import 'package:configurable/system_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/app.dart';
import 'package:mobile/shared/shared.dart';

void main() async {
  // fix for initializing the flutter package on the platform before executing the app
  WidgetsFlutterBinding.ensureInitialized();

  // load environment variable file
  var dotenvProvider = DotenvConfigurationProvider();
  SystemConfig.setProvider(dotenvProvider);

  //  inject dependencies here
  await Injector.init();

  runApp(ProviderScope(child: ECommerceApp()));
}
