/// File: home.dart
/// Project: mobile
/// Created Date: Thursday, June 17th 2021, 10:00:00 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 24th 2021 3:00:46 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobile/features/shared/presentation/widgets/button.dart';
import 'package:mobile/features/shopping/presentation/widgets/product.card.dart';
import 'package:mobile/shared/constants.dart';
import 'package:mobile/shared/sample.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO -> fetch from server
  final _products = sampleProducts;

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
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.shopping_bag)),
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
                              color:
                                  kColorScheme.onBackground.withOpacity(0.15),
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
                      return ProductCard(product: _products[index]);
                    },
                    separatorBuilder: (_, __) => SizedBox(width: 16),
                    itemCount: _products.length,
                  ),
                ),
              ),

              // more details button
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: RoundedCornerButton(
                  label: 'See all accessories',
                  onTap: () {},
                  icon: Icons.chevron_right_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
