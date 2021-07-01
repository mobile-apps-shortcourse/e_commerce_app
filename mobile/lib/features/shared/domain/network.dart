/// File: network.dart
/// Project: mobile
/// Created Date: Thursday, July 1st 2021, 10:50:32 am
/// Author: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Last Modified: Thursday, July 1st 2021 10:50:46 am
/// Modified By: Dennis Bilson <codelbas.quabynah@gmail.com>
/// -----
/// Copyright (c) 2021 Quabynah Codelabs LLC

abstract class BaseNetworkInfo {
  // shows whether device is connected to the internet or not
  Future<bool> get connected;
}
