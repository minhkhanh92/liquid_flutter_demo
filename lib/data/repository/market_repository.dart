import 'package:liquid_demo/data/api/service/market_service.dart';
import 'package:liquid_demo/data/model/cryptocurrency.dart';
import 'package:liquid_demo/data/socket/socket_service.dart';
import 'package:liquid_demo/di/locator.dart';

class MarketRepository {
  final _marketService = locator<MarketService>();
  final _socketService = locator<SocketService>();

  Future<List<Cryptocurrency>> getRankingList() {
    return _marketService.getRankingList();
  }

  subscribeTradeEvent(List<String> symbols, TradeEventCallback callback) {
    _socketService.subscribeTradeEvent(symbols, callback);
  }

  unsubscribeTradeEvent(List<String> symbols, TradeEventCallback callback) {
    _socketService.unsubscribeTradeEvent(symbols, callback);
  }
}
