import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExchangeRow extends StatefulWidget {
  Map<String, int> leftInventory;
  Map<String, int> rightInventory;
  final String itemName;

  ExchangeRow({
    @required this.itemName,
    @required this.leftInventory,
    @required this.rightInventory,
  });

  @override
  _ExchangeRowState createState() => _ExchangeRowState();
}

class _ExchangeRowState extends State<ExchangeRow> {
  Map<String, int> leftInventory;
  Map<String, int> rightInventory;

  void incrementRight(String key) {
    setState(() {
      if (leftInventory[key] > 0) {
        rightInventory[key]++;
        leftInventory[key]--;
      }
    });
  }

  void incrementLeft(String key) {
    setState(() {
      if (rightInventory[key] > 0) {
        rightInventory[key]--;
        leftInventory[key]++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    rightInventory ??= widget.rightInventory;
    leftInventory ??= widget.leftInventory;

    return Container(
      width: double.infinity,
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                leftInventory[widget.itemName].toString(),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(left: 10),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListTile(
              leading: IconButton(
                onPressed: rightInventory[widget.itemName] <= 0
                    ? () => {}
                    : () => incrementLeft(widget.itemName),
                icon: Icon(Icons.add_circle_outline),
                tooltip: 'Click here to take one',
                color: rightInventory[widget.itemName] <= 0
                    ? Theme.of(context).shadowColor
                    : Theme.of(context).highlightColor,
                iconSize: 28,
                // highlightColor: Colors.red[900],
              ),
              title: Container(
                child: Text(
                  widget.itemName,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              trailing: IconButton(
                onPressed: leftInventory[widget.itemName] <= 0
                    ? () => {}
                    : () => incrementRight(widget.itemName),
                icon: Icon(Icons.add_circle_outline),
                tooltip: 'Click here to give one',
                color: leftInventory[widget.itemName] <= 0
                    ? Theme.of(context).shadowColor
                    : Theme.of(context).highlightColor,
                iconSize: 28,
              ),
              dense: true,
              //tileColor: Colors.black12,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                rightInventory[widget.itemName].toString(),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(right: 10),
            ),
          )
        ],
      ),
    );
  }
}
