import 'package:flutter/material.dart';

import './exchangeRow.dart';

class ExchangePage extends StatelessWidget {
  Map<String, int> initialLeftInventory;
  Map<String, int> initialRightInventory;
  Map<String, int> leftInventory;
  Map<String, int> rightInventory;
  Map<String, int> requestedItems;

  ExchangePage(
      Map<String, int> leftInventory, Map<String, int> rightInventory) {
    // makes sure both maps have the same keys
    this.initialLeftInventory = leftInventory;
    rightInventory.forEach((key, value) {
      this.initialLeftInventory[key] ??= 0;
    });
    this.initialRightInventory = rightInventory;
    this.initialLeftInventory.forEach((key, value) {
      this.initialRightInventory[key] ??= 0;
    });

    this.rightInventory = new Map<String, int>.from(this.initialRightInventory);
    this.leftInventory = new Map<String, int>.from(this.initialLeftInventory);
  }

  void _generateRequestedMaterial(){
    requestedItems = {};
    leftInventory.forEach((key, value) {
      if(value != initialLeftInventory[key]){
        requestedItems[key] = value - initialLeftInventory[key];
      }
    });
    print(requestedItems.toString());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];
    leftInventory.forEach((key, value) {
      rows.add(ExchangeRow(
        itemName: key,
        leftInventory: leftInventory,
        rightInventory: rightInventory,
      ));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange items'),
      ),
      body: Column(children: rows),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRequestedMaterial,
        tooltip: 'Finish the exchange',
        child: Icon(Icons.check),
      ),
    );
  }
}
