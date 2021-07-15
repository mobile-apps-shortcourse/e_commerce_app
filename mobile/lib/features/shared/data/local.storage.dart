/// File: local.storage.dart
/// Project: mobile
/// Created Date: Thursday, July 1st 2021, 10:52:32 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, July 1st 2021 11:28:43 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC
import 'dart:convert';

import 'package:mobile/features/account/data/models/account/account.dart';
import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/features/shared/domain/local.storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// saves user data to a persistent file on the device
/// using [SharedPreferences]
class LocalStorage extends BaseLocalStorage {
  static final _accountKey = "account.key";
  static final _accountTypeKey = "account.type.key";
  static final _themeKey = "theme.key";

  final SharedPreferences prefs;

  LocalStorage({required this.prefs}) {
    // get current account
    if (prefs.getString(_accountKey) == null) {
      saveAccount = Account.basic();
    }
  }

  @override
  set saveAccount(BaseAccount? account) {
    prefs.setString(_accountKey, account == null ? "" : jsonEncode(account));
  }

  @override
  set setTheme(AppThemeMode themeMode) {
    prefs.setInt(_themeKey, themeMode.index);
  }

  @override
  BaseAccount? get userAccount =>
      Account.fromJson(jsonDecode(prefs.getString(_accountKey)!));

  @override
  AccountType? get accountType => prefs.getInt(_accountTypeKey) == null
      ? null
      : AccountType.values[prefs.getInt(_accountTypeKey)!];

  @override
  set saveAccountType(AccountType accountType) {
    prefs.setInt(_accountTypeKey, accountType.index);
  }
}
