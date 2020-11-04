import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExchangeRow extends StatefulWidget {
  final int initialLeftAmount;
  final int initialRightAmount;
  final String itemName;

  ExchangeRow(
      {@required this.itemName,
      this.initialLeftAmount,
      this.initialRightAmount});

  @override
  _ExchangeRowState createState() => _ExchangeRowState();
}

class _ExchangeRowState extends State<ExchangeRow> {
  int _leftAmount;
  int _rightAmount;

  final counterTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54);
  final itemTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54);

  void incrementRight() {
    setState(() {
      if (_leftAmount > 0) {
        _rightAmount++;
        _leftAmount--;
      }
    });
  }

  void incrementLeft() {
    setState(() {
      if (_rightAmount > 0) {
        _rightAmount--;
        _leftAmount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _leftAmount ??= widget.initialLeftAmount ?? 0;
    _rightAmount ??= widget.initialRightAmount ?? 0;

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
                _leftAmount.toString(),
                style: counterTextStyle,
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(left: 10),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListTile(
              leading: IconButton(
                onPressed: _rightAmount <= 0 ? null : incrementLeft,
                icon: Icon(Icons.add_circle_outline),
                tooltip: 'Click here to take one',
                color: _rightAmount <= 0 ? Colors.grey : Colors.black54,
                iconSize: 28,
                // highlightColor: Colors.red[900],
              ),
              title: Container(
                child: Text(
                  widget.itemName,
                  style: itemTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              trailing: IconButton(
                onPressed: _leftAmount <= 0 ? null : incrementRight,
                icon: Icon(Icons.add_circle_outline),
                tooltip: 'Click here to give one',
                color: _leftAmount <= 0 ? Colors.grey : Colors.black54,
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
                _rightAmount.toString(),
                style: counterTextStyle,
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
