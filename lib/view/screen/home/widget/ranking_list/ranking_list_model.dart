import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_demo/data/model/cryptocurrency.dart';
import 'package:liquid_demo/data/repository/market_repository.dart';
import 'package:liquid_demo/data/socket/model/trade_event.dart';
import 'package:liquid_demo/di/locator.dart';
import 'package:liquid_demo/liquid.dart';

class RankingListModel extends BaseModel {
  final _marketRepository = locator<MarketRepository>();
  List<Cryptocurrency> _items = [];

  List<RankingListSortBy> sortByValues = RankingListSortBy.values;
  RankingListSortBy sortBy = RankingListSortBy.priceChangeASC;
  List<String> items = [];
  Map<String, ValueNotifier<Cryptocurrency>> cryptocurrencies = {};

  @override
  loadDataInternal() async {
    _items = await _marketRepository.getRankingList();
    _sortItems();
  }

  setSortBy(RankingListSortBy value) {
    this.sortBy = value;
    _sortItems();
    notifyListeners();
  }

  _sortItems() {
    _items.sort((i1, i2) {
      switch (sortBy) {
        case RankingListSortBy.priceChangeASC:
          return i2.priceChangePercent.compareTo(i1.priceChangePercent);
        case RankingListSortBy.priceChangeDESC:
          return i1.priceChangePercent.compareTo(i2.priceChangePercent);
      }
    });

    if (items.isNotEmpty) {
      _unsubscribePriceChange();
    }

    cryptocurrencies.clear();
    items = _items.sublist(0, min(5, _items.length)).map((item) {
      cryptocurrencies[item.symbol] = ValueNotifier<Cryptocurrency>(item);
      return item.symbol;
    }).toList();
    _subscribePriceChange();
  }

  _subscribePriceChange() {
    _marketRepository.subscribeTradeEvent(items, _onTradeEvent);
  }

  _unsubscribePriceChange() {
    _marketRepository.unsubscribeTradeEvent(items, _onTradeEvent);
  }

  _onTradeEvent(TradeEvent event) {
    final item = cryptocurrencies[event.symbol];
    item?.value = item.value.copyWith(lastPrice: event.price);
  }

  @override
  void removeListener(void Function() listener) {
    _unsubscribePriceChange();
    super.removeListener(listener);
  }
}

enum RankingListSortBy { priceChangeASC, priceChangeDESC }
