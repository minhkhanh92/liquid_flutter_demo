import 'package:flutter/material.dart';
import 'package:liquid_demo/di/locator.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/view/app/app_model.dart';
import 'package:liquid_demo/view/screen/main/main_screen.dart';
import 'package:liquid_demo/view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class LiquidApp extends StatefulWidget {
  @override
  _LiquidAppState createState() => _LiquidAppState();
}

class _LiquidAppState extends State<LiquidApp> {
  final _model = locator<AppModel>();

  @override
  void initState() {
    super.initState();
    _model.init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: Consumer<AppModel>(
        builder: (context, model, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Liquid',
          theme: model.theme.themeData(context),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: model.locale,
          initialRoute: LRoutes.root,
          onGenerateRoute: _getRoute,
        ),
      ),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case LRoutes.root:
        return MaterialPageRoute(
          settings: RouteSettings(name: LRoutes.root),
          builder: (_) => _getRootScreen(),
        );
      default:
        throw Exception("Route ${settings.name} is not defined");
    }
  }

  Widget _getRootScreen() {
    if (_model.state == AppState.uninitialized) {
      return SplashScreen();
    }

    return MainScreen();
  }
}
