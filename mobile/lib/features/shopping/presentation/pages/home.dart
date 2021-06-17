/// File: home.dart
/// Project: mobile
/// Created Date: Thursday, June 17th 2021, 10:00:00 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 17th 2021 10:20:23 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    // theme
    var kTheme = Theme.of(context);

    // color scheme prop from the theme
    var kColorScheme = kTheme.colorScheme;

    // color scheme prop from the theme
    var kTextTheme = kTheme.textTheme;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // app bar
            Container(
              height: 64,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // search icon
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),

                  // category dropdown
                  GestureDetector(
                    onTap: () {
                      // TODO -> show categories to select from
                      print('tapped category');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: kColorScheme.onBackground.withOpacity(0.15),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Man',
                            style: kTextTheme.bodyText1?.copyWith(
                              color: kColorScheme.onBackground,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),

                  // shopping basket
                  IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),
                ],
              ),
            ),

            // user info
            Expanded(
              flex: 1,
              child: Container(),
            ),

            // trending
            Expanded(
              flex: 1,
              child: Container(),
            ),

            // categories
            Expanded(
              flex: 1,
              child: Container(),
            ),

            // products
            Expanded(
              flex: 1,
              child: Container(),
            ),

            // more details button
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
