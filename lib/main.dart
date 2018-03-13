import 'package:flutter/material.dart';

import 'api/cryptoapi.dart' as cryptoapi;
import 'api/coin.dart' show Coin;
import 'summary/coinwidget.dart' show CoinWidget;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.orangeAccent,
      ),
      home: new MyHomePage(title: 'Crypto Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cryptoCurrencyList = <Coin>[];

  @override
  initState() {
    super.initState();
    _getCryptoCurrencies();
  }

  _getCryptoCurrencies() async {
    var stream = await cryptoapi.getCoins('NZD');
    stream.listen((coin) => setState(() => cryptoCurrencyList.add(coin)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: cryptoCurrencyList.map((coin) => new CoinWidget(coin),).toList(),
      ),
    );
  }
}
