/// File: route.dart
/// Project: mobile
/// Created Date: Thursday, June 24th 2021, 12:58:25 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 24th 2021 1:29:29 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:auto_route/annotations.dart';
import 'package:mobile/features/account/presentation/pages/login.dart';
import 'package:mobile/features/account/presentation/pages/phone_number.verification.dart';
import 'package:mobile/features/account/presentation/pages/register.dart';
import 'package:mobile/features/onboarding/presentation/pages/welcome.dart';
import 'package:mobile/features/shopping/presentation/pages/home.dart';
import 'package:mobile/features/shopping/presentation/pages/product.dart';

/// flutter packages pub run build_runner watch --delete-conflicting-outputs
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: WelcomePage, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(page: ProductPage),
    AutoRoute(page: AuthenticationPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: PhoneNumberVerificationPage),
  ],
)
class $AppRouter {}
