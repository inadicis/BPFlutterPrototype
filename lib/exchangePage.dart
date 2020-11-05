import 'package:flutter/material.dart';

import './exchangeRow.dart';

class ExchangePage extends StatelessWidget {
  Map<String, int> leftInventory;
  Map<String, int> rightInventory;

  ExchangePage(Map<String, int> leftInventory, Map<String, int> rightInventory){
    // makes sure both maps have the same keys
    this.leftInventory = leftInventory;
    rightInventory.forEach((key, value) {
      this.leftInventory[key] ??= 0;
    });
    this.rightInventory = rightInventory;
    this.leftInventory.forEach((key, value) {
      this.rightInventory[key] ??= 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    leftInventory.forEach((key, value) {
      rows.add(ExchangeRow(itemName: key, initialLeftAmount: value, initialRightAmount: rightInventory[key],));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange items'),
      ),
      body: Column(
        children: rows
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Finish the exchange',
        child: Icon(Icons.check),
      ),
    );
  }
}
