/// File: product.dart
/// Project: mobile
/// Created Date: Thursday, June 24th 2021, 1:40:50 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, June 24th 2021 1:49:13 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

import 'package:mobile/features/shopping/domain/entities/product.dart';

class Product extends BaseProduct {
  final String id;
  final String name;
  final String? description;
  final ProductCategory category;
  final double price;
  final String picture;
  final String? model;
  final String? color;

  // use this to create a new product
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.picture,
    this.description,
    this.model,
    this.color,
  });

  // use this to update an existing product
  @override
  BaseProduct copyWith({
    String? name,
    String? description,
    ProductCategory? category,
    double? price,
    String? picture,
    String? model,
    String? color,
  }) =>
      Product(
        id: id,
        name: name ?? this.name,
        category: category ?? this.category,
        price: price ?? this.price,
        picture: picture ?? this.picture,
        color: color ?? this.color,
        description: description ?? this.description,
        model: model ?? this.model,
      );
}

// electronic product
class ElectronicProduct extends BaseElectronicProduct {
  final String id;
  final String name;
  final String? description;
  final ProductCategory category;
  final double price;
  final String picture;
  final String? model;
  final String? color;
  final ElectronicType electronicType;

  ElectronicProduct({
    required this.id,
    required this.name,
    required this.electronicType,
    required this.category,
    required this.price,
    required this.picture,
    this.model,
    this.description,
    this.color,
  });

  // use this to update an existing product
  @override
  BaseElectronicProduct copyWith({
    String? name,
    String? description,
    ProductCategory? category = ProductCategory.electronics,
    double? price,
    String? picture,
    String? model,
    String? color,
    ElectronicType? electronicType,
  }) =>
      ElectronicProduct(
        id: id,
        name: name ?? this.name,
        category: category ?? this.category,
        price: price ?? this.price,
        picture: picture ?? this.picture,
        color: color ?? this.color,
        description: description ?? this.description,
        model: model ?? this.model,
        electronicType: electronicType ?? this.electronicType,
      );
}
