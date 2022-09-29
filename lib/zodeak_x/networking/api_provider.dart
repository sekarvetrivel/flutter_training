import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graphql/client.dart';

import 'graphql/exception/api_exception.dart';
import 'graphql/graphql_webservice.dart';

ApiProvider apiProvider = ApiProvider();

class ApiProvider {
  /// Handling response Types
  dynamic _response(Map<String, dynamic> response) {
    switch (response['status_code']) {
      case 200:
        var responseJson = response;
        return responseJson;
      case 400:
        var responseJson = response;
        return responseJson;
      case 401:
        var responseJson = response;
        return responseJson;
      //throw BadRequestException(response.toString());
      case 403:
        throw UnauthorisedException(response.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response}');
    }
  }

  /// Query without params
  Future<dynamic> QueryWithoutParams(String query) async {
    var checkConnection = await Connectivity().checkConnectivity();
    QueryOptions options = QueryOptions(
      document: gql(query),
      // only return result from network
      fetchPolicy: FetchPolicy.noCache,
      // ignore cache data if any
      cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
    );

    if (checkConnection != ConnectivityResult.none) {
      try {
        final QueryResult graphQLQueryResult =
            await graphQLWebservice.startGraphQLClient().query(options);
        print((graphQLQueryResult.hasException)
            ? graphQLQueryResult.exception
            : graphQLQueryResult.data);
        if (graphQLQueryResult.hasException) {
          return graphQLQueryResult.exception?.graphqlErrors;
        } else {
          var validResponse = _response(
              graphQLQueryResult.data?[graphQLQueryResult.data?.keys.last]);
          return validResponse;
        }
      } on GraphQLError {
        print(GraphQLError);
      }
    } else {
      return false;
    }
  }

  /// Query with params
  Future<dynamic> QueryWithParams(
      String query, Map<String, dynamic> params) async {
    var checkConnection = await Connectivity().checkConnectivity();
    QueryOptions options = QueryOptions(
        document: gql(query),
        // only return result from network
        fetchPolicy: FetchPolicy.noCache,
        // ignore cache data if any
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        variables: params);
    print(params);
    if (checkConnection != ConnectivityResult.none) {
      try {
        final QueryResult graphQLQueryResult =
            await graphQLWebservice.startGraphQLClient().query(options);
        print((graphQLQueryResult.hasException)
            ? graphQLQueryResult.exception
            : graphQLQueryResult.data);
        if (graphQLQueryResult.hasException) {
          return graphQLQueryResult.exception?.graphqlErrors;
        } else {
          var validResponse = _response(
              graphQLQueryResult.data?[graphQLQueryResult.data?.keys.last]);
          return validResponse;
        }
      } on GraphQLError {
        print(GraphQLError);
      }
    } else {
      return false;
    }
  }

  /// Mutation without Params
  Future<dynamic> MutationWithoutParams(String mutation) async {
    var checkConnection = await Connectivity().checkConnectivity();
    MutationOptions options = MutationOptions(
      document: gql(mutation),
      // only return result from network
      fetchPolicy: FetchPolicy.noCache,
      // ignore cache data if any
      cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
    );
    if (checkConnection != ConnectivityResult.none) {
      try {
        final QueryResult graphQLQueryResult =
            await graphQLWebservice.startGraphQLClient().mutate(options);
        print((graphQLQueryResult.hasException)
            ? graphQLQueryResult.exception
            : graphQLQueryResult.data);
        if (graphQLQueryResult.hasException) {
          return graphQLQueryResult.exception?.graphqlErrors;
        } else {
          var validResponse = _response(
              graphQLQueryResult.data?[graphQLQueryResult.data?.keys.last]);
          return validResponse;
        }
      } on GraphQLError {
        print(GraphQLError);
      }
    } else {
      return false;
    }
  }

  /// Mutation With Params
  Future<dynamic> MutationWithParams(
      String mutation, Map<String, dynamic> params) async {
    var checkConnection = await Connectivity().checkConnectivity();
    print(params);
    MutationOptions options = MutationOptions(
        document: gql(mutation),
        // only return result from network
        fetchPolicy: FetchPolicy.noCache,
        // ignore cache data if any
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        variables: params);
    if (checkConnection != ConnectivityResult.none) {
      try {
        final QueryResult graphQLQueryResult =
            await graphQLWebservice.startGraphQLClient().mutate(options);
        print((graphQLQueryResult.hasException)
            ? graphQLQueryResult.exception
            : graphQLQueryResult.data);
        if (graphQLQueryResult.hasException) {
          return graphQLQueryResult.exception?.graphqlErrors;
        } else {
          var validResponse = _response(
              graphQLQueryResult.data?[graphQLQueryResult.data?.keys.last]);
          return validResponse;
        }
      } on GraphQLError {
        print(GraphQLError);
      }
    } else {
      return false;
    }
  }
}
