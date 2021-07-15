/// File: local.storage.dart
/// Project: mobile
/// Created Date: Thursday, July 1st 2021, 10:52:24 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, July 1st 2021 11:30:28 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC
import 'package:mobile/features/account/domain/entities/account.dart';

enum AppThemeMode { light, dark, system }

abstract class BaseLocalStorage {
  // get account details
  BaseAccount? get userAccount;

  // get the current user's account type
  AccountType? get accountType;

  // get current theme mode
  AppThemeMode get themeMode => AppThemeMode.light;

  // save account details
  set saveAccount(BaseAccount? account);

  set saveAccountType(AccountType accountType);

  // save theme details
  set setTheme(AppThemeMode themeMode);

  // whether user is logged in or not
  bool get isLoggedIn =>
      userAccount != null &&
      accountType != null &&
      userAccount!.userId.isNotEmpty;

  // reset storage
  void clear() {
    this.saveAccount = null;
    this.setTheme = AppThemeMode.light;
  }
}
