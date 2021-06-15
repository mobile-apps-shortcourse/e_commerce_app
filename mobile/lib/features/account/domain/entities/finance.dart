/// File: finance.dart
/// Project: mobile
/// Created Date: Tuesday, June 15th 2021, 11:35:53 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Tuesday, June 15th 2021 11:43:06 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

// preferred finance type
enum FinanceType { mobile_money, cash, credit_card, debit_card }

// shows the financial information of a user
abstract class BaseFinance {
  late FinanceType type;
  late String? accountHolderName;
  late int? creditCardNumber;
  late int? cvc;
  late String? phoneNumber;

  // used to update fields
  BaseFinance copyWith({
    String? userId,
    FinanceType? type,
    String? accountHolderName,
    int? creditCardNumber,
    int? cvc,
    String? phoneNumber,
  });
}
