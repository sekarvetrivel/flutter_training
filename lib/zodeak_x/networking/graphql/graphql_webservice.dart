import 'package:graphql/client.dart';

import '../../utils/constants/app_constants.dart';

class GraphQLWebservice{
  /// App Web services
  final baseUrl = constant.isdemo ?  constant.demoUrl : constant.baseUrl;
      var header =  {
    'authorization': "bearer ${constant.userToken.value}",
    'ip': constant.secretCode,
    'source': constant.deviceDetails?.source ?? "",
    'device': constant.deviceDetails?.device ?? "",
    'browser': constant.deviceDetails?.browser ?? "",
    'os': constant.deviceDetails?.os ?? "",
    'platform': constant.deviceDetails?.platform ?? "",
    'lang': 'en'
    };


/// GraphQL Intitilize
  GraphQLClient startGraphQLClient(){
    var changedToken = {'authorization': "bearer ${constant.userToken.value}"};
    header.addAll(changedToken);
    print(header);
    final Link appLink = HttpLink(baseUrl,
    defaultHeaders:header);
    return GraphQLClient(link: appLink,
        defaultPolicies: DefaultPolicies(
          watchMutation: Policies(
            fetch: FetchPolicy.noCache,
            cacheReread: CacheRereadPolicy.ignoreAll
          ),
          watchQuery: Policies(
            fetch: FetchPolicy.noCache,
            cacheReread: CacheRereadPolicy.ignoreAll
          ),
          query: Policies(
            fetch: FetchPolicy.noCache,
            cacheReread: CacheRereadPolicy.ignoreAll
          ),
          mutate: Policies(
            fetch: FetchPolicy.noCache,
            cacheReread: CacheRereadPolicy.ignoreAll
          ),
        ),
        cache: GraphQLCache(
          store: InMemoryStore(),
      partialDataPolicy: PartialDataCachePolicy.acceptForOptimisticData,
    ));
  }
}

GraphQLWebservice graphQLWebservice = GraphQLWebservice();