import 'package:flutter/material.dart';

class InventoryRow extends StatelessWidget {
  final int itemAmount;
  final String itemName;
  final String itemImage;

  final counterTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54);
  final itemTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54);

  InventoryRow({
    @required this.itemName,
    @required this.itemAmount,
    @required this.itemImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.black12,
        child: ListTile(
          leading: FlutterLogo(size: 56.0),
          title: Text(itemName, style: itemTextStyle),
          trailing: Text('$itemAmount', style: counterTextStyle),
        ));
  }
}
