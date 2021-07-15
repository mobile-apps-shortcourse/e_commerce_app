/// File: account.dart
/// Project: mobile
/// Created Date: Tuesday, June 15th 2021, 11:17:09 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Th/07/yyyy 10:nn:51
/// Modified By: Short Course May-July, 2021
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:mobile/shared/shared.dart';

// lists out all account types supported on the platform
enum AccountType { courier, customer, vendor }

extension AccountTypeX on AccountType {
  String asText() => toString().replaceAll('AccountType.', '').capitalize();
}

abstract class BaseAccount {
  late String userId; // account holder's id
  late AccountType type;

  Map<String, dynamic> toJson();

  @override
  String toString() => toJson().toString();
}
