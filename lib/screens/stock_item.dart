import 'package:flutter/material.dart';

class StockItem extends StatelessWidget {
  final Map item;
  StockItem(
    this.item, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${item["name"]}'),
      subtitle: Text('''
Localização: ${item["location"]}
Pontos: ${item["points"]}
Variação: ${item["variation"]}
          '''),
    );
  }
}
