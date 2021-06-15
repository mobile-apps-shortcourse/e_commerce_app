/// File: user.dart
/// Project: mobile
/// Created Date: Tuesday, June 15th 2021, 11:17:01 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Tuesday, June 15th 2021 12:19:47 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'product.dart';
import 'address.dart';
import 'finance.dart';

// all user basic props
abstract class BaseUser {
  late String id;
  late String firstName;
  late String lastName;
  // (can be email (e.g. quabynah@mail.com) or username (e.g. @quabynah))
  late String username;
  late String phoneNumber;
  late String? avatar;
}

// vehile type for courier
enum VehicleType { motorbike, van, bicycle }

// courier user model
abstract class BaseCourier extends BaseUser {
  late VehicleType vehicleType;
  late bool isLicensed;
  late bool isAvailable;
  late double ratings;

  // used to recommend couriers with the following conditions satisfied
  bool get recommended => isLicensed && ratings >= 3.5;

  // bool get recommendedBiker => recommended && vehicleType == VehicleType.motorbike;
}

// customer user model
abstract class BaseCustomer extends BaseUser {
  late BaseFinance finance;
  late BaseAddress address;
}

// business type
enum BusinessOperationType { online, physical, both }

// vendor
abstract class BaseVendor extends BaseUser {
  late BaseFinance finance;
  late BaseAddress address;
  late bool isVerified;
  late String businessDoc;
  late String nationalID;
  late BusinessOperationType businessType;
  late ProductCategory productCategory;
}
