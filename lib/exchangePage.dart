import 'package:flutter/material.dart';

import './exchangeRow.dart';

class ExchangePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange items'),
      ),
      body: Column(
        children: [
          ExchangeRow(
            itemName: 'Sword',
            initialLeftAmount: 10,
            initialRightAmount: 5,
          ),
          ExchangeRow(
            itemName: 'Bow',
            initialLeftAmount: 2,
            initialRightAmount: 1,
          ),
          ExchangeRow(
            itemName: 'Shield',
            initialLeftAmount: 0,
            initialRightAmount: 3,
          ),
          ExchangeRow(
            itemName: 'Arrows',
            initialLeftAmount: 60,
            initialRightAmount: 100,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Finish the exchange',
        child: Icon(Icons.check),
      ),
    );
  }
}
