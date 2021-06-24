/// File: product.dart
/// Project: mobile
/// Created Date: Thursday, June 24th 2021, 1:27:54 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 24th 2021 2:59:32 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobile/features/shared/presentation/widgets/button.dart';
import 'package:mobile/features/shopping/domain/entities/product.dart';

/// product details page
class ProductPage extends StatefulWidget {
  final BaseProduct product;

  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // product counter
  int _counter = 1;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
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
    super.dispose();
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
      body: Stack(
        children: [
          // image
          Positioned(
            width: size.width,
            height: size.height * 0.43,
            child: Column(
              children: [
                // product
                Hero(
                  tag: widget.product.picture,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.43,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.product.picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // back icon
          Positioned(
            left: 24,
            top: 36,
            child: GestureDetector(
              onTap: () => context.router.pop(),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: kColorScheme.background.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.chevron_left_outlined),
              ),
            ),
          ),

          // content
          Positioned.fill(
            top: size.height * 0.37,
            child: Container(
              decoration: BoxDecoration(
                color: kColorScheme.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(64),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 36,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // name
                  Text(
                    widget.product.name,
                    style: kTextTheme.headline5?.copyWith(color: Colors.black),
                  ),

                  // counter & price
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // counter
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                            color: kColorScheme.surface,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => _counter > 1
                                      ? setState(() => _counter--)
                                      : null,
                                  child: Center(
                                    child: Text(
                                      '-',
                                      style: kTextTheme.caption
                                          ?.copyWith(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '$_counter',
                                style: kTextTheme.bodyText1
                                    ?.copyWith(color: Colors.black),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() => _counter++),
                                  child: Center(
                                    child: Text(
                                      '+',
                                      style: kTextTheme.caption
                                          ?.copyWith(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          '\u20b5${widget.product.price}',
                          style: kTextTheme.headline5
                              ?.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  // description
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      widget.product.description ??
                          'No additional information for this product',
                      style:
                          kTextTheme.bodyText2?.copyWith(color: Colors.black54),
                    ),
                  ),

                  Spacer(),

                  // button
                  RoundedCornerButton(
                    label: 'Add to cart',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          // menu icon
          Positioned(
            right: 24,
            top: 36,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: kColorScheme.background.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: RotatedBox(
                quarterTurns: 2,
                child: Icon(Icons.short_text),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
