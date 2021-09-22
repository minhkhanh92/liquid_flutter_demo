import 'package:flutter/material.dart';
import 'package:liquid_demo/data/api/rest_client.dart';
import 'package:liquid_demo/data/socket/socket_service.dart';
import 'package:liquid_demo/di/locator.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/main.dart';

class AppModel extends ChangeNotifier {
  AppConfig appConfig;
  late LAppTheme theme = LAppTheme.blue;
  late Locale locale;

  AppModel(this.appConfig);

  AppState state = AppState.uninitialized;

  init() async {
    locale = AppLocalizations.supportedLocales.first;

    locator<RestClient>().init(baseApiUrl: appConfig.baseApiUrl);
    locator<SocketService>().connect(appConfig.socketUrl);

    await Future.delayed(Duration(milliseconds: 1500));
    state = AppState.initialized;
    notifyListeners();
  }

  setTheme(LAppTheme theme) {
    this.theme = theme;
    notifyListeners();
  }

  setLocale(Locale locale) {
    this.locale = locale;
    notifyListeners();
  }
}

enum AppState { uninitialized, initialized }
