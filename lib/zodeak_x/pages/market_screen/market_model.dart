// To parse this JSON data, do
//
//     final tradePairs = tradePairsFromJson(jsonString);

import 'dart:convert';

class TradePairs {
    TradePairs({
        this.statusCode,
        this.statusMessage,
        this.result,
        this.typename,
    });

    int? statusCode;
    String? statusMessage;
    List<ListOfTradePairs>? result;
    String? typename;

    factory TradePairs.fromRawJson(String str) => TradePairs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TradePairs.fromJson(Map<String, dynamic> json) => TradePairs(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        statusMessage: json["status_message"] == null ? null : json["status_message"],
        result: json["result"] == null ? null : List<ListOfTradePairs>.from(json["result"].map((x) => ListOfTradePairs.fromJson(x))),
        typename: json["__typename"] == null ? null : json["__typename"],
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "status_message": statusMessage == null ? null : statusMessage,
        "result": result == null ? null : List<dynamic>.from(result!.map((x) => x.toJson())),
        "__typename": typename == null ? null : typename,
    };
}

class ListOfTradePairs {
    ListOfTradePairs({
        this.lastPrice,
        this.change24H,
        this.changePercent,
        this.high24H,
        this.low24H,
        this.volume24H,
        this.pair,
        this.status,
        this.typename,
        this.fromImage
    });

    String? lastPrice;
    String? change24H;
    String? changePercent;
    String? high24H;
    String? low24H;
    String? fromImage;
    String? volume24H;
    String? pair;
    Status? status;
    Typename? typename;

    factory ListOfTradePairs.fromRawJson(String str) => ListOfTradePairs.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListOfTradePairs.fromJson(Map<String, dynamic> json) => ListOfTradePairs(
        lastPrice: json["last_price"] == null ? null : json["last_price"],
        change24H: json["change_24h"] == null ? null : json["change_24h"],
        changePercent: json["change_percent"] == null ? null : json["change_percent"],
        high24H: json["high_24h"] == null ? null : json["high_24h"],
        low24H: json["low_24h"] == null ? null : json["low_24h"],
        volume24H: json["volume_24h"] == null ? null : json["volume_24h"],
        pair: json["pair"] == null ? null : json["pair"],
        status: json["status"] == null ? null : statusValues.map![json["status"]],
        fromImage: json["from_image"] == null ? null : json["from_image"],
        typename: json["__typename"] == null ? null : typenameValues.map![json["__typename"]],
    );

    Map<String, dynamic> toJson() => {
        "last_price": lastPrice == null ? null : lastPrice,
        "change_24h": change24H == null ? null : change24H,
        "change_percent": changePercent == null ? null : changePercent,
        "high_24h": high24H == null ? null : high24H,
        "low_24h": low24H == null ? null : low24H,
        "volume_24h": volume24H == null ? null : volume24H,
        "pair": pair == null ? null : pair,
        "status": status == null ? null : statusValues.reverse[status],
        "from_image": fromImage == null ? null : fromImage,
        "__typename": typename == null ? null : typenameValues.reverse[typename],
    };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
    "Active": Status.ACTIVE
});

enum Typename { GET_TRADE_PAIRS }

final typenameValues = EnumValues({
    "getTradePairs": Typename.GET_TRADE_PAIRS
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap ?? Map();
    }
}
