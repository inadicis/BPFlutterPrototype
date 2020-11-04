import 'package:flutter/material.dart';

import './inventoryRow.dart';

class InventoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: Column(
        children: [
          InventoryRow(
            itemName: 'Sword',
            itemAmount: 10,
            itemImage: 'sword.png'
          ),
          InventoryRow(
              itemName: 'Shield',
              itemAmount: 5,
              itemImage: 'shield.png'
          ),
          InventoryRow(
              itemName: 'Bow',
              itemAmount: 1,
              itemImage: 'bow.png'
          ),
          InventoryRow(
              itemName: 'Arrows',
              itemAmount: 80,
              itemImage: 'arrow.png'
          ),
        ],
      ),

    );
  }
}
