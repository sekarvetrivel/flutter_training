import '../networking/api_provider.dart';
import '../pages/market_screen/market_model.dart';
import '../queries/market_queries.dart';

ZodeakXRepository zodeakXRepository = ZodeakXRepository();

class ZodeakXRepository {
  Future<TradePairs> fetchTradePairs() async {
    final tradeResponse =
        await apiProvider.QueryWithoutParams(marketQueries.getTradePairs);
    return TradePairs.fromJson(tradeResponse);
  }
}
