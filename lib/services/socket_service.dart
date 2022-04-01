import 'dart:convert';

import 'package:soccet/models/bitcoin_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService{
  static String baseUrl = 'wss://ws.bitstamp.net';
  static WebSocketChannel channel = WebSocketChannel.connect(Uri.parse(baseUrl));

  static void connectSocketChannel() {
    channel.sink.add(jsonEncode({
      "event":"bts:subscribe",
      "data": {
        "channel": "live_trades_btcusd"
      }
    }),);
  }

  static void closeSocketChannel() {
    channel.sink.close();
  }

  static Bitcoins parseData(String data){
    Bitcoins bitcoins = bitcoinsFromJson(data);
    return bitcoins;
  }


}