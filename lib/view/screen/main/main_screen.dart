import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/view/screen/home/home_screen.dart';
import 'package:liquid_demo/view/screen/main/placeholder_screen.dart';
import 'package:liquid_demo/view/screen/setting/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);
  final _tabs = [
    MainTab.home,
    MainTab.market,
    MainTab.trade,
    MainTab.funds,
    MainTab.settings
  ];
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _tabs.map((tab) => tab.screen(context)).toList()),
      floatingActionButton: _tradeButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: Theme.of(context).dividerColor))),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (_tabs[index] == MainTab.trade) {
              // ignore trade tab
              return;
            }
            _pageController.jumpToPage(index);
            setState(() {
              _currentTabIndex = index;
            });
          },
          currentIndex: _currentTabIndex,
          items: _tabs.map((tab) {
            final icon = tab == MainTab.trade
                ? Icon(tab.icon, size: 22, color: Colors.transparent)
                : Icon(tab.icon, size: 22);
            return BottomNavigationBarItem(
                icon: icon, label: tab.title(context));
          }).toList()),
    );
  }

  Widget _tradeButton() {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: SpeedDial(
        renderOverlay: true,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        elevation: 0,
        icon: Icons.add,
        child:
            SvgPicture.asset(LIcons.trade, color: theme.colorScheme.onPrimary),
        activeIcon: Icons.close,
        buttonSize: 44,
        childrenButtonSize: 50,
        spaceBetweenChildren: LDimens.spacing12,
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.colorScheme.onPrimary,
        children: [
          localizations(context).spot,
          localizations(context).margin,
          localizations(context).infinity
        ]
            .map((item) => SpeedDialChild(
                child: SvgPicture.asset(LIcons.liquid,
                    width: 14, color: theme.colorScheme.onPrimary),
                label: item,
                backgroundColor: Colors.lightBlue))
            .toList(),
      ),
    );
  }
}

enum MainTab { home, market, trade, funds, settings }

extension MainTabExt on MainTab {
  IconData get icon {
    switch (this) {
      case MainTab.home:
        return Icons.home;
      case MainTab.market:
        return Icons.bar_chart;
      case MainTab.trade:
        return Icons.add;
      case MainTab.funds:
        return Icons.account_balance_wallet;
      case MainTab.settings:
        return Icons.settings;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case MainTab.home:
        return localizations(context).home;
      case MainTab.market:
        return localizations(context).market;
      case MainTab.trade:
        return localizations(context).trade;
      case MainTab.funds:
        return localizations(context).funds;
      case MainTab.settings:
        return localizations(context).settings;
    }
  }

  Widget screen(BuildContext context) {
    switch (this) {
      case MainTab.home:
        return HomeScreen();
      case MainTab.settings:
        return SettingsScreen();
      default:
        return PlaceHolderScreen(title: title(context));
    }
  }
}
