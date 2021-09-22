import 'package:flutter/material.dart';
import 'package:liquid_demo/data/model/cryptocurrency.dart';
import 'package:liquid_demo/liquid.dart';
import 'package:liquid_demo/view/screen/home/widget/ranking_list/ranking_list_model.dart';
import 'package:provider/provider.dart';

class RankingListWidget extends StatefulWidget {
  const RankingListWidget({Key? key}) : super(key: key);

  @override
  _RankingListWidgetState createState() => _RankingListWidgetState();
}

class _RankingListWidgetState
    extends BaseState<RankingListModel, RankingListWidget>
    with SingleTickerProviderStateMixin {
  final _itemHeight = 54.0;
  final _nameColumnWidth = 140.0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: model.sortByValues.length, vsync: this);
    _tabController.addListener(() {
      model.setSortBy(model.sortByValues[_tabController.index]);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void onModelReady() {
    model.loadData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.symmetric(
          vertical: LDimens.spacing24, horizontal: LDimens.spacing16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(localizations(context).rankingList,
            style: theme.textTheme.headline6),
        ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 140,
            ),
            child: super.build(context))
      ]),
    );
  }

  @override
  Widget buildContentView(BuildContext context, RankingListModel model) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _filterTabBar(),
      _header(),
      _list(),
    ]);
  }

  Widget _filterTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: LDimens.spacing20),
      child: SizedBox(
        height: 42,
        child: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(
                vertical: 0, horizontal: LDimens.spacing32),
            tabs: model.sortByValues
                .map((e) => Tab(child: Text(_sortByTitle(e))))
                .toList()),
      ),
    );
  }

  Widget _header() {
    final textStyle = Theme.of(context).textTheme.caption;
    return Column(
      children: [
        const Divider(height: 0),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: LDimens.spacing12),
            child: Row(children: [
              SizedBox(
                  width: _nameColumnWidth,
                  child: Text(localizations(context).name, style: textStyle)),
              Text(localizations(context).price, style: textStyle),
              Spacer(),
              Text(localizations(context).percentChange, style: textStyle)
            ])),
        const Divider(height: 0)
      ],
    );
  }

  Widget _list() {
    final items = model.items;
    return Container(
      height: items.length * _itemHeight,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => CryptocurrencyItemWidget(
              value: model.cryptocurrencies[items[index]]!,
              height: _itemHeight,
              nameColumnWidth: _nameColumnWidth),
          itemCount: items.length),
    );
  }

  String _sortByTitle(RankingListSortBy sortBy) {
    switch (sortBy) {
      case RankingListSortBy.priceChangeASC:
        return localizations(context).gainers;
      case RankingListSortBy.priceChangeDESC:
        return localizations(context).losers;
    }
  }
}

class CryptocurrencyItemWidget extends StatelessWidget {
  final ValueNotifier<Cryptocurrency> value;
  final double height;
  final double nameColumnWidth;

  const CryptocurrencyItemWidget(
      {required this.value,
      required this.height,
      required this.nameColumnWidth});

  @override
  Widget build(BuildContext context) {
    return ValueListenableProvider.value(
      value: value,
      child: Consumer<Cryptocurrency>(builder: (context, item, child) {
        final theme = Theme.of(context);
        final changeColor = item.priceChange > 0 ? Colors.green : Colors.red;
        return Container(
          height: height,
          child: Row(
            children: [
              SizedBox(
                  width: nameColumnWidth,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "${item.name} / ",
                        style: theme.textTheme.bodyText1),
                    TextSpan(
                        text: item.base,
                        style: theme.textTheme.bodyText1?.copyWith(
                            color:
                                theme.colorScheme.onSurface.withOpacity(0.6)))
                  ]))),
              Text(item.lastPrice.toString(), style: theme.textTheme.bodyText1),
              Spacer(),
              Container(
                  width: 76,
                  height: 36,
                  decoration: BoxDecoration(
                      color: changeColor.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(6)),
                  alignment: Alignment.center,
                  child: Text(
                      item.priceChangePercent.formatPercent(showSign: true),
                      style: theme.textTheme.bodyText1
                          ?.copyWith(color: changeColor)))
            ],
          ),
        );
      }),
    );
  }
}
