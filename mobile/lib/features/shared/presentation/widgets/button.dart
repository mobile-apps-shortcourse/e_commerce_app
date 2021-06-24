/// File: button.dart
/// Project: mobile
/// Created Date: Thursday, June 24th 2021, 2:53:55 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 24th 2021 2:59:55 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:flutter/material.dart';

class RoundedCornerButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final IconData? icon;

  const RoundedCornerButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.icon,
  }) : super(key: key);

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

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        width: size.width,
        decoration: BoxDecoration(
          color: kColorScheme.onBackground,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // button text
            Text(
              label,
              style: kTextTheme.button?.copyWith(
                color: kColorScheme.background,
              ),
            ),

            if (icon != null) ...{
              // icon
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.chevron_right,
                  color: kColorScheme.background,
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
