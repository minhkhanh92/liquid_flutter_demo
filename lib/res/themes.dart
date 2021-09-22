import 'package:flutter/material.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/res/colors.dart';

const fontFamily = "Roboto";

enum LAppTheme { blue, light, dark }

extension LAppThemeExt on LAppTheme {
  LColorScheme get colorScheme {
    switch (this) {
      case LAppTheme.blue:
        return LColorScheme.blue();
      case LAppTheme.light:
        return LColorScheme.light();
      case LAppTheme.dark:
        return LColorScheme.dark();
    }
  }

  Brightness get brightness {
    switch (this) {
      case LAppTheme.blue:
        return Brightness.dark;
      case LAppTheme.light:
        return Brightness.light;
      case LAppTheme.dark:
        return Brightness.dark;
    }
  }

  ThemeData themeData(BuildContext context) {
    final colorScheme = this.colorScheme;
    return ThemeData(
        brightness: brightness,
        primaryColor: colorScheme.primary,
        backgroundColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.scaffoldBackground,
        dividerColor: colorScheme.divider,
        colorScheme: ColorScheme.dark(
          brightness: brightness,
          primary: colorScheme.primary,
          surface: colorScheme.surface,
          onPrimary: colorScheme.onPrimary,
          onSurface: colorScheme.onSurface,
        ),
        fontFamily: fontFamily,
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: colorScheme.onSurface,
            displayColor: colorScheme.onSurface.withOpacity(0.6)),
        appBarTheme: AppBarTheme(
            foregroundColor: colorScheme.appBarForeground,
            backgroundColor: colorScheme.appBarBackground,
            elevation: 0,
            centerTitle: true),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colorScheme.appBarBackground,
            selectedItemColor: colorScheme.navigationBarSelectedItem,
            unselectedItemColor: colorScheme.navigationBarUnselectedItem),
        tabBarTheme: TabBarTheme(
            indicator: BoxDecoration(
                color: colorScheme.tabBarIndicator,
                borderRadius: BorderRadius.circular(10)),
            labelColor: colorScheme.tabBarSelectedItem,
            unselectedLabelColor: colorScheme.tabBarUnselectedItem));
  }

  String name(BuildContext context) {
    switch (this) {
      case LAppTheme.blue:
        return localizations(context).blue;
      case LAppTheme.light:
        return localizations(context).light;
      case LAppTheme.dark:
        return localizations(context).dark;
    }
  }
}
