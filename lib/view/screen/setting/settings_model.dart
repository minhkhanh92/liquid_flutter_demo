import 'package:liquid_demo/di/locator.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/view/app/app_model.dart';

class SettingsModel extends BaseModel {
  @override
  ViewState get initState => ViewState.loaded;

  AppModel get _appModel => locator<AppModel>();

  LAppTheme get theme => _appModel.theme;

  changeTheme() {
    final themes = LAppTheme.values;
    final index = themes.indexOf(theme) + 1;
    final nextTheme = themes[index % themes.length];
    _appModel.setTheme(nextTheme);
  }

  changeLanguage() {
    final locales = AppLocalizations.supportedLocales;
    final index = locales.indexOf(_appModel.locale) + 1;
    _appModel.setLocale(locales[index % locales.length]);
  }
}
