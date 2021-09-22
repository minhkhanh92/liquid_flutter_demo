import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/view/screen/base/base_state.dart';
import 'package:liquid_demo/view/screen/home/home_model.dart';
import 'package:liquid_demo/view/screen/home/widget/event_slider/event_slider_widget.dart';
import 'package:liquid_demo/view/screen/home/widget/ranking_list/ranking_list_widget.dart';
import 'package:liquid_demo/view/screen/home/widget/trade_shortcut/trade_shortcut_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeModel, HomeScreen>
    with BaseAutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
          leading: Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(LIcons.liquid,
                  width: 20,
                  color: Theme.of(context).appBarTheme.foregroundColor)),
          title: localizations(context).greeting),
      body: super.build(context),
    );
  }

  @override
  Widget buildContentView(BuildContext context, HomeModel model) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: LDimens.spacing8),
      child: Column(
        children: [
          EventSliderWidget(),
          divider,
          TradeShortcutWidget(),
          divider,
          RankingListWidget()
        ],
      ),
    );
  }

  Widget get divider =>
      const Divider(height: LDimens.spacing4, color: Colors.transparent);

  @override
  bool get wantKeepAlive => true;
}
