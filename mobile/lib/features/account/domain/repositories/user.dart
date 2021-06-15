/// File: user.dart
/// Project: mobile
/// Created Date: Tuesday, June 15th 2021, 12:04:11 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Tuesday, June 15th 2021 12:25:34 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:mobile/features/account/domain/entities/finance.dart';
import 'package:mobile/features/account/domain/entities/product.dart';
import 'package:mobile/features/account/domain/entities/user.dart';

/// defines all transactions on the [BaseUser] entity
abstract class BaseUserRepository {
  Future<BaseUser?> createUser({
    required String firstName,
    required String lastName,
    required String username,
    FinanceType? type,
    String? accountHolderName,
    int? creditCardNumber,
    int? cvc,
    String? avatar,
    String phoneNumber,
    VehicleType? vehicleType,
    String? businessDoc,
    String? nationalID,
    BusinessOperationType? businessType,
    ProductCategory? productCategory,
  });

  Future<BaseUser?> getUserById({required String id});

  // get live updates from user entity
  Stream<BaseUser?> observeUserById({required String id});

  Stream<BaseUser?> currentUser();

  Future<bool> updateUser({
    String? firstName,
    String? lastName,
    FinanceType? type,
    String? accountHolderName,
    int? creditCardNumber,
    int? cvc,
    String? avatar,
    String phoneNumber,
    VehicleType? vehicleType,
    String? businessDoc,
    String? nationalID,
    BusinessOperationType? businessType,
    ProductCategory? productCategory,
  });
}
