import 'package:liquid_demo/data/api/service/event_service.dart';
import 'package:liquid_demo/data/model/event.dart';
import 'package:liquid_demo/di/locator.dart';

class EventRepository {
  final _eventService = locator<EventService>();

  Future<List<Event>> getEvents(String language) {
    return _eventService.getEvents(language);
  }
}
