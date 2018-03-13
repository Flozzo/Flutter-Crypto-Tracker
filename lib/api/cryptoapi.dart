import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'coin.dart' show Coin;

/// Retrieves Coins from the CoinMarketCap API
Future<Stream<Coin>> getCoins(String convertCurrency) async {
  var cryptoApiUrl = 'https://api.coinmarketcap.com/v1/ticker/?convert=$convertCurrency&limit=10';

  var client = new http.Client();
  var streamedResponse = await client.send(new http.Request('get', Uri.parse(cryptoApiUrl)));

  return streamedResponse.stream
    .transform(UTF8.decoder)
    .transform(JSON.decoder)
    .expand((jsonBody) => (jsonBody as List))
    .map((jsonCoin) => new Coin.fromJson(jsonCoin));
}
