/// File: page.indicator.dart
/// Project: mobile
/// Created Date: Thursday, June 10th 2021, 12:01:14 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 10th 2021 12:17:13 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:flutter/material.dart';

// displays a page indicator
class PageIndicator extends StatelessWidget {
  final int pages;
  final int currentPageIndex;

  const PageIndicator({
    Key? key,
    required this.pages,
    required this.currentPageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// this spreads the `_buildIndicator` this number of times (i.e. pages)
        for (var i = 0; i < pages; i++) ...{
          _buildIndicator(i == currentPageIndex, context),
        }
      ],
    );
  }

  Widget _buildIndicator(bool active, context) {
    // theme props
    var kTheme = Theme.of(context);
    var kColorScheme = kTheme.colorScheme;

    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      width: active ? 36 : 6,
      height: 6,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: active ? kColorScheme.onBackground : kTheme.disabledColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
