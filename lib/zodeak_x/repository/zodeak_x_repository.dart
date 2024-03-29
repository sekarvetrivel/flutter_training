import '../../training_task/login_screen/model/login_model.dart';
import '../mutations/CommonMutations.dart';
import '../networking/api_provider.dart';
import '../../paypal_product/model/braintree_client_token.dart';
import '../pages/market_screen/market_model.dart';
import '../queries/market_queries.dart';

ZodeakXRepository zodeakXRepository = ZodeakXRepository();

class ZodeakXRepository {
  Future<TradePairs> fetchTradePairs() async {
    final tradeResponse =
        await apiProvider.QueryWithoutParams(marketQueries.getTradePairs);
    return TradePairs.fromJson(tradeResponse);
  }

  Future<BraintreeClientTokenModel> fetchBraintreeClientToken() async {
    final tradeResponse =
    await apiProvider.QueryWithoutParams(commonMutations.getBraintreeClientToken);
    return BraintreeClientTokenModel.fromJson(tradeResponse);
  }

  Future<LoginModel> MutateLoginUser(Map<String, dynamic> params) async {
    var loginUserResponse =
        await apiProvider.MutationWithParams(commonMutations.loginUser, params);
    return LoginModel.fromJson(loginUserResponse);
  }

  Future<LoginModel> fetchMarketPrice(Map<String, dynamic> mutateUserParams) async{
    final dashBoardBalanceResponse = await apiProvider.MutationWithParams(commonMutations.getMarketPrice, mutateUserParams);
    return LoginModel.fromJson(dashBoardBalanceResponse);
  }

}
