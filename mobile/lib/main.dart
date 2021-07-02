/// File: main.dart
/// Project: mobile
/// Created Date: Wednesday, June 9th 2021, 9:48:08 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Wednesday, June 9th 2021 10:33:21 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:flutter/material.dart';
import 'package:mobile/core/app.dart';
import 'package:mobile/shared/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // fix for initializing the flutter package on the platform before executing the app
  WidgetsFlutterBinding.ensureInitialized();

  //  inject dependecies here
  await Injector.init();

  runApp(ProviderScope(child: ECommerceApp()));
}
