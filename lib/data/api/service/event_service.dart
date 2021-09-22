import 'package:liquid_demo/data/model/event.dart';

class EventService {
  Future<List<Event>> getEvents(String language) async {
    await Future.delayed(Duration(milliseconds: 300));
    if (language == 'vi') {
      return [
        Event(
            title: "Chương trình giới thiệu",
            description: "Mời bạn bè và cùng thu về tới 50%."),
        Event(
            title: "Mua và đổi tiền kỹ thuật số",
            description: "Giờ bạn có thể dễ dàng mua TKS bằng thẻ.")
      ];
    }
    return [
      Event(
          title: "Referral Program",
          description: "Refer friend and earn up to 50% together."),
      Event(
          title: "Buy & Swap Crypto",
          description: "Now you can buy crypto easily by card.")
    ];
  }
}
