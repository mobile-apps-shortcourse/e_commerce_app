/// File: utils.dart
/// Project: mobile
/// Created Date: Tuesday, June 29th 2021, 4:34:00 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Tuesday, June 29th 2021 4:38:23 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:mobile/features/shared/domain/utils.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// implementation of [BaseNetworkInfo]
class NetworkInfo extends BaseNetworkInfo {
  final InternetConnectionChecker checker;

  // constructor
  NetworkInfo({required this.checker});

  @override
  Future<bool> get connected => checker.hasConnection;
}
