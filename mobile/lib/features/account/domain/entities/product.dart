/// File: product.dart
/// Project: mobile
/// Created Date: Tuesday, June 15th 2021, 11:17:16 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Tuesday, June 15th 2021 12:02:29 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

// product category
enum ProductCategory {
  clothing,
  accessories,
  footwear,
  electronics,
  groceries,
}

// product entity
abstract class BaseProduct {
  late String id;
  late String name;
  late String? description;
  late ProductCategory category;
  late double price;
  late String picture;

  BaseProduct copyWith({
    String id,
    String name,
    String? description,
    ProductCategory category,
    double price,
    String picture,
  });
}

// types of electronics
enum ElectronicType {
  phone,
  laptop,
  tv,
  sound_system,
  gaming_console,
}

// electronic data model
abstract class BaseElectronicProduct extends BaseProduct {
  late ElectronicType electronicType;

  @override
  final ProductCategory category = ProductCategory.electronics;

  @override
  BaseElectronicProduct copyWith({
    String id,
    String name,
    String? description,
    ProductCategory category = ProductCategory.electronics,
    double price,
    String picture,
  });
}
