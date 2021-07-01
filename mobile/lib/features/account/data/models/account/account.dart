/// File: account.dart
/// Project: mobile
/// Created Date: Thursday, July 1st 2021, 10:35:43 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, July 1st 2021 11:29:59 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(fieldRename: FieldRename.snake)
class Account extends BaseAccount {
  final String userId;
  final AccountType type;

  Account({required this.userId, required this.type});

  factory Account.basic() => Account(userId: '', type: AccountType.customer);

  /// A necessary factory constructor for creating a new Account instance
  /// from a map. Pass the map to the generated `_$AccountFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Account.
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
