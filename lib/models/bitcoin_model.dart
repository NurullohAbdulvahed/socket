// To parse this JSON data, do
//
//     final bitcoins = bitcoinsFromJson(jsonString);

import 'dart:convert';

Bitcoins bitcoinsFromJson(String str) => Bitcoins.fromJson(json.decode(str));

String bitcoinsToJson(Bitcoins data) => json.encode(data.toJson());

class Bitcoins {
  Bitcoins({
    this.data,
    this.channel,
    this.event,
  });

  Data? data;
  String? channel;
  String? event;

  factory Bitcoins.fromJson(Map<String, dynamic> json) => Bitcoins(
    data: Data.fromJson(json["data"]) ,
    channel: json["channel"],
    event: json["event"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "channel": channel,
    "event": event,
  };
}

class Data {
  Data({
    this.id,
    this.timestamp,
    this.amount,
    this.amountStr,
    this.price,
    this.priceStr,
    this.type,
    this.microtimestamp,
    this.buyOrderId,
    this.sellOrderId,
  });

  int? id;
  String? timestamp;
  double? amount;
  String? amountStr;
  double? price;
  String? priceStr;
  int? type;
  String? microtimestamp;
  int? buyOrderId;
  int? sellOrderId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    timestamp: json["timestamp"],
    amount: json["amount"] ?? "",
    amountStr: json["amount_str"],
    price: json["price"],
    priceStr: json["price_str"],
    type: json["type"],
    microtimestamp: json["microtimestamp"],
    buyOrderId: json["buy_order_id"],
    sellOrderId: json["sell_order_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "timestamp": timestamp,
    "amount": amount,
    "amount_str": amountStr,
    "price": price,
    "price_str": priceStr,
    "type": type,
    "microtimestamp": microtimestamp,
    "buy_order_id": buyOrderId,
    "sell_order_id": sellOrderId,
  };
}
