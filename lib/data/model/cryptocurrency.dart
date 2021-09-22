class Cryptocurrency {
  late String symbol;
  late String name;
  late String base;
  late double priceChange;
  late double priceChangePercent;
  late double lastPrice;
  late double openPrice;
  late double volume;

  Cryptocurrency(
      {this.symbol = "",
      this.name = "",
      this.base = "",
      this.priceChange = 0,
      this.priceChangePercent = 0,
      this.lastPrice = 0,
      this.openPrice = 0,
      this.volume = 0});

  Cryptocurrency copyWith({required double lastPrice}) {
    return Cryptocurrency(
        symbol: symbol,
        name: name,
        base: base,
        openPrice: openPrice,
        volume: volume,
        lastPrice: lastPrice,
        priceChange: lastPrice - openPrice,
        priceChangePercent: (lastPrice - openPrice) / openPrice * 100);
  }

  Cryptocurrency.fromJson(dynamic json) {
    symbol = json["symbol"];
    final regex = RegExp("(.*)(BTC|ETH|USDT|BNB|BUSD|PAX|USDC|USDS)");
    final matches = regex.allMatches(symbol).toList();
    if (matches.isNotEmpty) {
      name = matches.first.group(1) ?? "";
      base = matches.first.group(2) ?? "";
    } else {
      name = symbol.substring(0, symbol.length - 3);
      base = symbol.substring(name.length);
    }

    priceChange = double.parse(json["priceChange"]);
    priceChangePercent = double.parse(json["priceChangePercent"]);
    lastPrice = double.parse(json["lastPrice"]);
    openPrice = double.parse(json["openPrice"]);
    volume = double.parse(json["volume"]);
  }
}
