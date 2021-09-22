class TradeEvent {
  late String symbol;
  late double price;

  TradeEvent({this.symbol = "", this.price = 0});

  TradeEvent.fromJson(dynamic json) {
    symbol = json["s"];
    price = double.tryParse(json["p"]) ?? 0;
  }
}
