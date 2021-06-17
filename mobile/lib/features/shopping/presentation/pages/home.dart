/// File: home.dart
/// Project: mobile
/// Created Date: Thursday, June 17th 2021, 10:00:00 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 17th 2021 12:20:46 pm
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
    // theme
    var kTheme = Theme.of(context);

    // color scheme prop from the theme
    var kColorScheme = kTheme.colorScheme;

    // color scheme prop from the theme
    var kTextTheme = kTheme.textTheme;

    // size of display
    var size = MediaQuery.of(context).size;

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
                            'Men',
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
            Padding(
              padding: EdgeInsets.only(
                left: 24,
                top: 16,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi, Alex!', // TODO -> use current user's name
                  style: kTextTheme.headline6?.copyWith(
                    color: kColorScheme.onBackground,
                  ),
                ),
              ),
            ),

            // trending
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: 12,
                ),
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // header
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        'New collection from Versace', // TODO -> use trending product's brand
                        style: kTextTheme.headline6?.copyWith(
                          color: kColorScheme.onBackground.withOpacity(0.4),
                        ),
                      ),
                    ),

                    // trending product
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: kColorScheme.onBackground.withOpacity(0.15),
                          ),
                        ),
                        child: Row(
                          children: [
                            // trending product image
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kColorScheme.surface,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      // TODO -> use trending product's image
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1589363460779-cd717d2ed8fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1789&q=80')),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                              ),
                            ),

                            // icon
                            InkWell(
                              splashColor: kColorScheme.surface,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              onTap: () {
                                // TODO -> show trending product details
                              },
                              child: Container(
                                width: size.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  // color: kColorScheme.background,
                                ),
                                alignment: Alignment.center,
                                child: Icon(Icons.arrow_right_alt_outlined),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // categories
            Container(
              padding: EdgeInsets.fromLTRB(24, 12, 0, 12),
              height: 56,
              width: size.width,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // TODO -> update UI with selected category
                    },
                    child: Row(
                      children: [
                        // category name
                        Text(
                          // TODO -> category name
                          'Accessories',
                          style: kTextTheme.headline6?.copyWith(
                            color: kColorScheme.onBackground
                                .withOpacity(index == 0 ? 1.0 : 0.25),
                          ),
                        ),

                        // category products count
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          alignment: Alignment.topRight,
                          child: Text(
                            // TODO -> category product count
                            '123',
                            style: kTextTheme.caption?.copyWith(
                              color: kColorScheme.onBackground
                                  .withOpacity(index == 0 ? 1.0 : 0.25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 16),
                itemCount: 10,
              ),
            ),

            // products
            Expanded(
              flex: 3,
              child: SizedBox(
                width: size.width,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        color: kColorScheme.surface,
                      ),
                      child: Column(
                        children: [
                          // image
                          Flexible(
                            flex: 3,
                            child: Container(
                                decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1592842232655-e5d345cbc2d0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1334&q=80',
                                ),
                                fit: BoxFit.cover,
                              ),
                            )),
                          ),

                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // name
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    'Leather',
                                    style: kTextTheme.bodyText1?.copyWith(
                                      color: kColorScheme.onSurface,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),

                                // model & color
                                Text(
                                  'Weekender (Brown)',
                                  style: kTextTheme.bodyText2?.copyWith(
                                    color: kColorScheme.onSurface
                                        .withOpacity(0.45),
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                // price
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0),
                                  child: Text(
                                    '\$59.99',
                                    style: kTextTheme.bodyText1?.copyWith(
                                      color: kColorScheme.onSurface,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(width: 16),
                  itemCount: 12,
                ),
              ),
            ),

            // more details button
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  // TODO -> show all products under selected category
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kColorScheme.onBackground,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // button text
                      //  TODO -> set name of selected category here
                      Text(
                        'See all accessories',
                        style: kTextTheme.button?.copyWith(
                          color: kColorScheme.background,
                        ),
                      ),

                      // icon
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.chevron_right,
                          color: kColorScheme.background,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
