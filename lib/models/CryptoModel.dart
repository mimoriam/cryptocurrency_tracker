import 'dart:convert';

// Models:

// Screens:

// Services:

// State:

// Widgets:

// Custom:

CryptoModel cryptoModelFromJson(String str) => CryptoModel.fromJson(json.decode(str));

String cryptoModelToJson(CryptoModel data) => json.encode(data.toJson());

class CryptoModel {
  CryptoModel({
    required this.data,
    required this.info,
  });

  final List<Datum> data;
  final Info info;

  factory CryptoModel.fromJson(Map<String, dynamic> json) => CryptoModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "info": info.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.symbol,
    required this.name,
    required this.nameid,
    required this.rank,
    required this.priceUsd,
    required this.percentChange24H,
    required this.percentChange1H,
    required this.percentChange7D,
    required this.priceBtc,
    required this.marketCapUsd,
    required this.volume24,
    required this.volume24A,
    required this.csupply,
    this.tsupply = "",
    this.msupply = "",
  });

  final String id;
  final String symbol;
  final String name;
  final String nameid;
  final int rank;
  final String priceUsd;
  final String percentChange24H;
  final String percentChange1H;
  final String percentChange7D;
  final String priceBtc;
  final String marketCapUsd;
  final double volume24;
  final double volume24A;
  final String csupply;
  final String tsupply;
  final String msupply;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        nameid: json["nameid"],
        rank: json["rank"],
        priceUsd: json["price_usd"],
        percentChange24H: json["percent_change_24h"],
        percentChange1H: json["percent_change_1h"],
        percentChange7D: json["percent_change_7d"],
        priceBtc: json["price_btc"],
        marketCapUsd: json["market_cap_usd"],
        volume24: json["volume24"].toDouble(),
        volume24A: json["volume24a"].toDouble(),
        csupply: json["csupply"],
        tsupply: json["tsupply"] == null ? "" : json["tsupply"],
        msupply: json["msupply"] == null ? "" : json["msupply"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "nameid": nameid,
        "rank": rank,
        "price_usd": priceUsd,
        "percent_change_24h": percentChange24H,
        "percent_change_1h": percentChange1H,
        "percent_change_7d": percentChange7D,
        "price_btc": priceBtc,
        "market_cap_usd": marketCapUsd,
        "volume24": volume24,
        "volume24a": volume24A,
        "csupply": csupply,
        // ignore: unnecessary_null_comparison
        "tsupply": tsupply == null ? "" : tsupply,
        // ignore: unnecessary_null_comparison
        "msupply": msupply == null ? "" : msupply,
      };
}

class Info {
  Info({
    required this.coinsNum,
    required this.time,
  });

  final int coinsNum;
  final int time;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        coinsNum: json["coins_num"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "coins_num": coinsNum,
        "time": time,
      };
}
