/// File: home.dart
/// Project: mobile
/// Created Date: Thursday, June 17th 2021, 10:00:00 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Th/07/yyyy 10:nn:58
/// Modified By: Short Course May-July, 2021
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/features/account/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/widgets/button.dart';
import 'package:mobile/features/shopping/presentation/widgets/product.card.dart';
import 'package:mobile/shared/shared.dart';

part 'home.courier.dart';

part 'home.customer.dart';

part 'home.vendor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authBloc = AuthBloc(repository: Injector.get());

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // sets color for status bar (at the top) & navigation bar (at the bottom)
    // of the screen
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var shouldClose = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Leaving already?'),
            content: Text('Do you wish to exit from $kAppName'),
            actions: [
              TextButton(
                onPressed: () => context.router.pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => context.router.pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        );
        return Future<bool>.value(shouldClose);
      },
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: _authBloc.isVendor
              ? VendorHomePage()
              : _authBloc.isCourier
                  ? CourierHomePage()
                  : CustomerHomePage(),
        ),
      ),
    );
  }
}
