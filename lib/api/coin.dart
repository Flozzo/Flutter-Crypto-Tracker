class Coin {
  final id;
	final name;
	final symbol;
	final double priceNzd;
	final double percentChange24h;
	final double percentChange7d;

  Coin.fromJson(Map jsonMap) :
    id = jsonMap['id'],
    name = jsonMap['name'],
    symbol = jsonMap['symbol'],
    priceNzd = double.parse(jsonMap['price_nzd']),
    percentChange24h = double.parse(jsonMap['percent_change_24h']),
    percentChange7d = double.parse(jsonMap['percent_change_7d']);

  @override
    String toString() {
      return 'Coin: $name, value is $priceNzd';
    }
}