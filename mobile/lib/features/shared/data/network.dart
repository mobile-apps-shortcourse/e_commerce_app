/// File: network.dart
/// Project: mobile
/// Created Date: Thursday, July 1st 2021, 10:51:20 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, July 1st 2021 10:51:45 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:mobile/features/shared/domain/network.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// implementation of [BaseNetworkInfo]
class NetworkInfo extends BaseNetworkInfo {
  final InternetConnectionChecker checker;

  // constructor
  NetworkInfo({required this.checker});

  @override
  Future<bool> get connected async => await checker.hasConnection;
}
