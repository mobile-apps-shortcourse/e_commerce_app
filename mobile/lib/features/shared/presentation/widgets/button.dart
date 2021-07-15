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
import 'package:mobile/shared/shared.dart';

class RoundedCornerButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final IconData? icon;
  final bool enabled;

  const RoundedCornerButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.icon,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        width: DeviceConfig.kDeviceWidth,
        decoration: BoxDecoration(
          color: enabled
              ? DeviceConfig.kColorScheme.onBackground
              : DeviceConfig.kColorScheme.surface,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // button text
            Text(
              label,
              style: DeviceConfig.kTextTheme.button?.copyWith(
                color: enabled
                    ? DeviceConfig.kColorScheme.background
                    : DeviceConfig.kColorScheme.onSurface.withOpacity(0.38),
              ),
            ),

            if (icon != null) ...{
              // icon
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Icon(
                  icon,
                  color: enabled
                      ? DeviceConfig.kColorScheme.background
                      : DeviceConfig.kColorScheme.onSurface.withOpacity(0.38),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
