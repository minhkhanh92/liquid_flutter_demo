import 'dart:ui';

class LColorScheme {
  final Color primary;
  final Color surface;
  final Color onPrimary;
  final Color onSurface;
  final Color scaffoldBackground;
  final Color appBarBackground;
  final Color appBarForeground;
  final Color divider;
  final Color navigationBarSelectedItem;
  final Color navigationBarUnselectedItem;
  final Color tabBarSelectedItem;
  final Color tabBarUnselectedItem;
  final Color tabBarIndicator;

  const LColorScheme({
    required this.primary,
    required this.surface,
    required this.onPrimary,
    required this.onSurface,
    required this.scaffoldBackground,
    required this.appBarBackground,
    required this.appBarForeground,
    required this.divider,
    required this.navigationBarSelectedItem,
    required this.navigationBarUnselectedItem,
    required this.tabBarSelectedItem,
    required this.tabBarUnselectedItem,
    required this.tabBarIndicator,
  });

  const LColorScheme.blue({
    this.primary = const Color(0xFF0055FE),
    this.scaffoldBackground = const Color(0xFF040C3B),
    this.appBarBackground = const Color(0xFF040C3B),
    this.appBarForeground = const Color(0xFFFFFFFF),
    this.surface = const Color(0xFF020D4B),
    this.onPrimary = const Color(0xFFFFFFFF),
    this.onSurface = const Color(0xFFFFFFFF),
    this.divider = const Color(0xFF17266B),
    this.navigationBarSelectedItem = const Color(0xFF0055FE),
    this.navigationBarUnselectedItem = const Color(0xFFFFFFFF),
    this.tabBarSelectedItem = const Color(0xFFFFFFFF),
    this.tabBarUnselectedItem = const Color(0x99FFFFFF),
    this.tabBarIndicator = const Color(0x800055FE),
  });

  const LColorScheme.light({
    this.primary = const Color(0xFF0055FE),
    this.scaffoldBackground = const Color(0xFFF6F6F6),
    this.appBarBackground = const Color(0xFFF6F6F6),
    this.appBarForeground = const Color(0xFF000000),
    this.surface = const Color(0xFFFFFFFF),
    this.onPrimary = const Color(0xFFFFFFFF),
    this.onSurface = const Color(0xFF000000),
    this.divider = const Color(0xFFD6D6D6),
    this.navigationBarSelectedItem = const Color(0xFF0055FE),
    this.navigationBarUnselectedItem = const Color(0xFF7B7B7B),
    this.tabBarSelectedItem = const Color(0xFF000000),
    this.tabBarUnselectedItem = const Color(0xFF949494),
    this.tabBarIndicator = const Color(0xFFE0E0E0),
  });

  const LColorScheme.dark({
    this.primary = const Color(0xFF0055FE),
    this.scaffoldBackground = const Color(0xFF0B0E11),
    this.appBarBackground = const Color(0xFF0B0E11),
    this.appBarForeground = const Color(0xFFFFFFFF),
    this.surface = const Color(0xFF101219),
    this.onPrimary = const Color(0xFFFFFFFF),
    this.onSurface = const Color(0xFFFFFFFF),
    this.divider = const Color(0xFF1D202B),
    this.navigationBarSelectedItem = const Color(0xFF0055FE),
    this.navigationBarUnselectedItem = const Color(0xFFFFFFFF),
    this.tabBarSelectedItem = const Color(0xFFFFFFFF),
    this.tabBarUnselectedItem = const Color(0x99FFFFFF),
    this.tabBarIndicator = const Color(0xFF23273C),
  });
}
