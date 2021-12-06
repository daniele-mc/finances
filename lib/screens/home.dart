import 'package:finances/main.dart';
import 'package:finances/screens/stock_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Finanças'),
        ),
        body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                      child: Text(
                    "Carregando dados",
                    style: TextStyle(color: Colors.blue, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ));
                default:
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      "Erro ao carregar dados",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ));
                  } else {
                    final data = snapshot.data["results"]["stocks"];

                    return ListView(children: [
                      StockItem(data["CAC"]),
                      StockItem(data["DOWJONES"]),
                      StockItem(data["IBOVESPA"]),
                      StockItem(data["IFIX"]),
                      StockItem(data["NASDAQ"]),
                      StockItem(data["NIKKEI"])
                    ]);
                  }
              }
            }));
  }
}
