/// File: account.dart
/// Project: mobile
/// Created Date: Tuesday, June 15th 2021, 11:17:09 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Tuesday, June 15th 2021 11:18:53 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

// lists out all account types supported on the platform
enum AccountType { courier, customer, vendor }

abstract class BaseAccount {
  late String userId; // account holder's id
  late AccountType type;
}
