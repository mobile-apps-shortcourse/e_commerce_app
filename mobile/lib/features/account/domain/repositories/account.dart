/// File: account.dart
/// Project: mobile
/// Created Date: Tuesday, June 15th 2021, 12:03:52 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, July 1st 2021 10:44:32 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:mobile/features/account/domain/entities/account.dart';

// type of oauth
enum OAuthType { google, facebook, twitter, apple }

/// defines all transactions on the [BaseAccount] entity
abstract class BaseAccountRepository {
  bool get isLoggedIn;

  Future<BaseAccount?> login({
    required String username,
    required String password,
  });

  Future<BaseAccount?> loginWithOAuth({
    required OAuthType type
  });

  Future<BaseAccount?> createAccount({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
    required AccountType accountType,
  });

  Future<bool> resetPassword({required String username});

  Future<bool> deleteAccount({required String id});

  Future<void> logout();
}
