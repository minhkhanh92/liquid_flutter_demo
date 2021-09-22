import 'package:flutter/material.dart';
import 'package:liquid_demo/data/model/event.dart';
import 'package:liquid_demo/data/repository/event_repository.dart';
import 'package:liquid_demo/di/locator.dart';
import 'package:liquid_demo/view/app/app_model.dart';
import 'package:liquid_demo/view/screen/base/base_model.dart';

class EventSliderModel extends BaseModel {
  final _eventRepository = locator<EventRepository>();
  Locale? _locale;
  List<Event>? events;

  @override
  loadDataInternal() async {
    _locale = locator<AppModel>().locale;
    events = await _eventRepository.getEvents(_locale!.languageCode);
  }

  checkLocaleChange() {
    if (_locale != locator<AppModel>().locale) {
      loadData();
    }
  }
}
