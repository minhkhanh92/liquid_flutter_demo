import 'package:get_it/get_it.dart';
import 'package:liquid_demo/data/api/rest_client.dart';
import 'package:liquid_demo/data/api/service/event_service.dart';
import 'package:liquid_demo/data/api/service/market_service.dart';
import 'package:liquid_demo/data/repository/event_repository.dart';
import 'package:liquid_demo/data/repository/market_repository.dart';
import 'package:liquid_demo/data/socket/socket_service.dart';
import 'package:liquid_demo/view/app/app_model.dart';
import 'package:liquid_demo/view/screen/home/home_model.dart';
import 'package:liquid_demo/view/screen/home/widget/event_slider/event_slider_model.dart';
import 'package:liquid_demo/view/screen/home/widget/ranking_list/ranking_list_model.dart';
import 'package:liquid_demo/view/screen/setting/settings_model.dart';

import '../main.dart';

final locator = GetIt.instance;

void setupLocator(AppConfig appConfig) {
  locator.registerLazySingleton(() => RestClient());

  locator.registerLazySingleton(() => EventService());
  locator.registerLazySingleton(() => MarketService());
  locator.registerLazySingleton(() => SocketService());

  locator.registerLazySingleton(() => EventRepository());
  locator.registerLazySingleton(() => MarketRepository());

  locator.registerLazySingleton(() => AppModel(appConfig));
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => SettingsModel());
  locator.registerFactory(() => EventSliderModel());
  locator.registerFactory(() => RankingListModel());
}
