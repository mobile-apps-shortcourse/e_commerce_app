/// File: utils.dart
/// Project: mobile
/// Created Date: Tuesday, June 29th 2021, 4:33:41 pm
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Tuesday, June 29th 2021 4:37:53 pm
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

// device network information
abstract class BaseNetworkInfo {
  // shows whether device is connected to the internet or not
  Future<bool> get connected;
}
