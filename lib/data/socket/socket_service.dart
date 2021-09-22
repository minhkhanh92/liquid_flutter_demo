import 'dart:convert';

import 'package:liquid_demo/data/socket/model/request.dart';
import 'package:liquid_demo/data/socket/model/trade_event.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef TradeEventCallback = void Function(TradeEvent event);

class SocketService {
  static const _tradeEvent = "trade";

  late WebSocketChannel _channel;
  var _id = 1;

  List<TradeEventCallback> _tradeEventCallbacks = [];
  Map<String, int> _tradeSubscribedSymbolCount = {};

  connect(String endpoint) {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(endpoint));
      _channel.stream.listen((data) {
        _onResponse(data);
      });
    } catch (e) {
      //TODO handle error
      print(e);
    }
  }

  disconnect() {
    _channel.sink.close();
  }

  subscribeTradeEvent(List<String> symbols, TradeEventCallback callback) {
    if (!_tradeEventCallbacks.contains(callback)) {
      _tradeEventCallbacks.add(callback);
    }
    final unsubscribedSymbols = symbols.where((symbol) {
      final count = _tradeSubscribedSymbolCount[symbol] ?? 0;
      _tradeSubscribedSymbolCount[symbol] = count + 1;
      return count == 0;
    }).toList();
    if (unsubscribedSymbols.isNotEmpty) {
      final params = unsubscribedSymbols.map((symbol) {
        _tradeSubscribedSymbolCount[symbol] = 1;
        return "${symbol.toLowerCase()}@$_tradeEvent";
      }).toList();
      _subscribeStream(params);
    }
  }

  unsubscribeTradeEvent(List<String> symbols, TradeEventCallback callback) {
    _tradeEventCallbacks.remove(callback);
    final subscribedSymbols = symbols.where((symbol) {
      if (_tradeSubscribedSymbolCount.containsKey(symbol)) {
        final count = _tradeSubscribedSymbolCount[symbol]! - 1;
        if (count < 1) {
          _tradeSubscribedSymbolCount.remove(symbol);
        } else {
          _tradeSubscribedSymbolCount[symbol] = count;
          return false;
        }
      }
      return true;
    }).toList();
    if (subscribedSymbols.isNotEmpty) {
      final params = subscribedSymbols
          .map((symbol) => "${symbol.toLowerCase()}@$_tradeEvent")
          .toList();
      _unsubscribeStream(params);
    }
  }

  _subscribeStream(List<String> params) {
    _sendRequest(Request(id: _id++, method: "SUBSCRIBE", params: params));
  }

  _unsubscribeStream(List<String> params) {
    _sendRequest(Request(id: _id++, method: "UNSUBSCRIBE", params: params));
  }

  _sendRequest(Request request) {
    try {
      _channel.sink.add(request.toJson());
    } catch (e) {
      //TODO handle error
      print("send request error: $e");
    }
  }

  _onResponse(String response) {
    try {
      final json = jsonDecode(response);
      final event = json["e"] ?? "";
      switch (event) {
        case _tradeEvent:
          _handleTradeEvent(TradeEvent.fromJson(json));
          break;
      }
    } catch (e) {
      print(e);
    }
  }

  _handleTradeEvent(TradeEvent event) {
    for (var callback in _tradeEventCallbacks) {
      callback(event);
    }
  }
}
