import 'package:flutter/material.dart';
import 'package:mobile/core/app.dart';
import 'package:mobile/shared/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // fix for initializing the flutter package on the platform before executing the app
  WidgetsFlutterBinding.ensureInitialized();

  //  inject dependencies here
  await Injector.init();

  runApp(ProviderScope(child: ECommerceApp()));
}