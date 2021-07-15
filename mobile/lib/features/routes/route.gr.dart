// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../account/presentation/pages/account.picker.dart' as _i9;
import '../account/presentation/pages/login.dart' as _i6;
import '../account/presentation/pages/phone_number.verification.dart' as _i8;
import '../account/presentation/pages/register.dart' as _i7;
import '../onboarding/presentation/pages/welcome.dart' as _i3;
import '../shopping/domain/entities/product.dart' as _i10;
import '../shopping/presentation/pages/home.dart' as _i4;
import '../shopping/presentation/pages/product.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.WelcomePage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.HomePage();
        }),
    ProductRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ProductRouteArgs>();
          return _i5.ProductPage(key: args.key, product: args.product);
        }),
    AuthenticationRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.AuthenticationPage();
        }),
    RegisterRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.RegisterPage();
        }),
    PhoneNumberVerificationRoute.name: (routeData) =>
        _i1.MaterialPageX<dynamic>(
            routeData: routeData,
            builder: (_) {
              return const _i8.PhoneNumberVerificationPage();
            }),
    UserAccountPickerRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.UserAccountPickerPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(WelcomeRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(ProductRoute.name, path: '/product-page'),
        _i1.RouteConfig(AuthenticationRoute.name, path: '/authentication-page'),
        _i1.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i1.RouteConfig(PhoneNumberVerificationRoute.name,
            path: '/phone-number-verification-page'),
        _i1.RouteConfig(UserAccountPickerRoute.name,
            path: '/user-account-picker-page')
      ];
}

class WelcomeRoute extends _i1.PageRouteInfo {
  const WelcomeRoute() : super(name, path: '/');

  static const String name = 'WelcomeRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

class ProductRoute extends _i1.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({_i2.Key? key, required _i10.BaseProduct product})
      : super(name,
            path: '/product-page',
            args: ProductRouteArgs(key: key, product: product));

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({this.key, required this.product});

  final _i2.Key? key;

  final _i10.BaseProduct product;
}

class AuthenticationRoute extends _i1.PageRouteInfo {
  const AuthenticationRoute() : super(name, path: '/authentication-page');

  static const String name = 'AuthenticationRoute';
}

class RegisterRoute extends _i1.PageRouteInfo {
  const RegisterRoute() : super(name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

class PhoneNumberVerificationRoute extends _i1.PageRouteInfo {
  const PhoneNumberVerificationRoute()
      : super(name, path: '/phone-number-verification-page');

  static const String name = 'PhoneNumberVerificationRoute';
}

class UserAccountPickerRoute extends _i1.PageRouteInfo {
  const UserAccountPickerRoute()
      : super(name, path: '/user-account-picker-page');

  static const String name = 'UserAccountPickerRoute';
}
