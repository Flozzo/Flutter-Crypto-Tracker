import 'package:flutter/material.dart';

import '../api/coin.dart' show Coin;

class CoinWidget extends StatelessWidget {
  CoinWidget(this.coin);
  final Coin coin;

  getTextColor(percentChange) {
    var textColor = Colors.black87;
    if (percentChange > 0)
      textColor = Colors.lightGreen;
    else if (percentChange < 0) textColor = Colors.red;
    return textColor;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(right: 16.0),
      child: new Row(
        children: [
          new Expanded(
            child: new ListTile(
              title: new Text(coin.name),
              subtitle: new Text('\$${coin.priceNzd.toStringAsFixed(2)}'),
              leading: new CircleAvatar(
                child:
                    new Text(coin.symbol, style: new TextStyle(fontSize: 16.0)),
                foregroundColor: Colors.white,
                backgroundColor: Colors.orangeAccent,
              ),
            ),
          ),
          new Column(
            children: [
              new Text('24h: '),
              new Text('7d: '),
            ],
          ),
          new Column(
            children: [
              new Text(
                '${coin.percentChange24h.toString()}%',
                style:
                    new TextStyle(color: getTextColor(coin.percentChange24h)),
              ),
              new Text(
                '${coin.percentChange7d.toString()}%',
                style:
                    new TextStyle(color: getTextColor(coin.percentChange24h)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
