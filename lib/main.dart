import 'package:flutter/material.dart';
import 'package:liquid_demo/view/app/app.dart';

import 'di/locator.dart';

void main() {
  setupLocator(AppConfig(
      baseApiUrl: "https://api.binance.com/api/v3/",
      socketUrl: "wss://stream.binance.com/ws"));
  runApp(LiquidApp());
}

class AppConfig {
  String baseApiUrl;
  String socketUrl;

  AppConfig({required this.baseApiUrl, required this.socketUrl});
}
