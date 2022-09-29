MarketQueries marketQueries = MarketQueries();

class MarketQueries {
  final getTradePairs = r''' 
  query getTradePairs {
  getTradePairs {
    status_code
    status_message
    result {
      last_price
      change_24h
      change_percent
      high_24h
      low_24h
      volume_24h
      from_image
      pair
      status
      __typename
    }
    __typename
  }
}
''';
}
