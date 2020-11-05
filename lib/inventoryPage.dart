import 'package:flutter/material.dart';

import './inventoryRow.dart';

class InventoryPage extends StatelessWidget {
  final Map<String, int> inventory;

  InventoryPage(this.inventory);

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    inventory.forEach((key, value) {
      rows.add(InventoryRow(
        itemName: key,
        itemAmount: value,
        itemImage: 'random',
      ));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: Column(children: rows),
    );
  }
}
