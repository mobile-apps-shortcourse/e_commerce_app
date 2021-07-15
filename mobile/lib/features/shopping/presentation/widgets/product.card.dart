/// File: product.card.dart
/// Project: mobile
/// Created Date: Thursday, June 24th 2021, 1:30:37 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 24th 2021 2:36:16 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/shopping/domain/entities/product.dart';
import 'package:mobile/shared/shared.dart';

class ProductCard extends StatelessWidget {
  final BaseProduct product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.navigate(ProductRoute(product: product)),
      child: Container(
        width: DeviceConfig.kDeviceWidth * 0.4,
        decoration: BoxDecoration(
          color: DeviceConfig.kColorScheme.surface,
        ),
        child: Column(
          children: [
            // image
            Flexible(
              flex: 3,
              child: Hero(
                tag: product.picture,
                child: SizedBox(
                  width: DeviceConfig.kDeviceWidth,
                  height: DeviceConfig.kDeviceHeight,
                  child: CachedNetworkImage(
                    imageUrl: product.picture,
                    fit: BoxFit.cover,
                    errorWidget: (context, _, __) => Container(
                      width: DeviceConfig.kDeviceWidth,
                      height: DeviceConfig.kDeviceHeight,
                      color: DeviceConfig.kColorScheme.surface,
                    ),
                  ),
                ),
              ),
            ),

            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // name
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 6.0),
                    child: Text(
                      product.name,
                      style: DeviceConfig.kTextTheme.bodyText1?.copyWith(
                        color: DeviceConfig.kColorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // model & color
                  Text(
                    '${product.model} (${product.color})',
                    style: DeviceConfig.kTextTheme.bodyText2?.copyWith(
                      color:
                          DeviceConfig.kColorScheme.onSurface.withOpacity(0.45),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  // price
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      '\u20b5${product.price}',
                      style: DeviceConfig.kTextTheme.bodyText1?.copyWith(
                        color: DeviceConfig.kColorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
