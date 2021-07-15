/// Filename: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile\lib\shared\shared.dart
/// Path: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile
/// Created Date: Thursday, July 15th 2021, 9:58:39 am
/// Author: Short Course May-July, 2021
///
/// Copyright (c) 2021 University of Ghana

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mobile/features/shared/domain/local.storage.dart';
import 'package:mobile/features/shared/domain/network.dart';
import 'package:riverpod/riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile/features/account/data/repositories/account.dart';
import 'package:mobile/features/account/domain/repositories/account.dart';
import 'package:mobile/features/shared/data/local.storage.dart';
import 'package:mobile/features/shared/data/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:logger/logger.dart';
import 'package:mobile/features/shopping/data/models/product.dart';
import 'package:mobile/features/shopping/domain/entities/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:configurable/dotenv_configuration_provider.dart';
import 'package:configurable/system_config.dart';

export 'package:mobile/features/routes/route.gr.dart';
export 'package:auto_route/auto_route.dart';

part 'config.dart';
part 'constants.dart';
part 'extensions.dart';
part 'injector.dart';
part 'logger.dart';
part 'sample.dart';
part 'ui.dart';
