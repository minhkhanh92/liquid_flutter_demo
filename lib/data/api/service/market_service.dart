import 'package:liquid_demo/data/api/api_endpoint.dart';
import 'package:liquid_demo/data/api/service/base_service.dart';
import 'package:liquid_demo/data/model/cryptocurrency.dart';

class MarketService extends BaseService {
  Future<List<Cryptocurrency>> getRankingList() async {
    final data = await get(MarketApi.rankingList);
    return List<Cryptocurrency>.from(
        data.map((item) => Cryptocurrency.fromJson(item)));
  }
}
