/// Filename: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile\lib\features\account\presentation\pages\account.picker.dart
/// Path: c:\Users\quaby\Documents\GitHub\e_commerce_app\mobile
/// Created Date: Thursday, July 15th 2021, 9:43:40 am
/// Author: Short Course May-July, 2021
///
/// Copyright (c) 2021 University of Ghana

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/account/domain/entities/account.dart';
import 'package:mobile/shared/shared.dart';

class UserAccountPickerPage extends StatefulWidget {
  const UserAccountPickerPage({Key? key}) : super(key: key);

  @override
  UserAccountPickerPageState createState() => UserAccountPickerPageState();
}

class UserAccountPickerPageState extends State<UserAccountPickerPage> {
  final _accountTypeImages = <String>[
    'https://images.unsplash.com/photo-1543499459-d1460946bdc6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y291cmllcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1556740738-b6a63e27c4df?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGN1c3RvbWVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
    'https://images.unsplash.com/photo-1556745753-b2904692b3cd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2VsbGVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // intro section
          'Welcome cherished user'.h5(),
          'Select an account type to get started'
              .bodyText2(opacity: 0.67)
              .top(4),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                var accountType = AccountType.values[index];
                var accountImage = _accountTypeImages[index];

                return Container(
                  decoration: BoxDecoration(
                    color: DeviceConfig.kColorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      // image here
                      // Image.network(accountImage),
                      CachedNetworkImage(imageUrl: accountImage),

                      // account type text
                      accountType.asText().bodyText1(),
                    ],
                  ),
                );
              },
              itemCount: AccountType.values.length,
            ),
          ),
        ],
      ).horizontal(24),
    );
  }
}
