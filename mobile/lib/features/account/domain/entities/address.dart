/// File: address.dart
/// Project: mobile
/// Created Date: Tuesday, June 15th 2021, 11:43:50 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Tuesday, June 15th 2021 11:45:14 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

// user (customer, vendor) physical address / location
abstract class BaseAddress {
  late String name;
  late double lat;
  late double lng;
  late String? ghPostAddress;
}
