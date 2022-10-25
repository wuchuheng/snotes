import 'package:flutter/material.dart';
import 'package:revelation/pages/login_page/devices/lg1024/index.dart';
import 'package:revelation/pages/login_page/devices/phone/index.dart';
import 'package:revelation/service/device_service/index.dart';
import 'package:wuchuheng_logger/wuchuheng_logger.dart';

class LoginPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(builder: (_) => LoginPage());

  @override
  Widget build(BuildContext context) {
    Logger.info('Build widget LoginPage', symbol: 'build');
    switch (DeviceService.deviceHook.value) {
      case DeviceType.phone:
        return const PhoneLoginPage();
      case DeviceType.windows:
        return const Lg1024LoginPage();
    }
  }
}
