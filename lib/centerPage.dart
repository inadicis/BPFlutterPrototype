import 'package:flutter/material.dart';

class CenterPage extends StatelessWidget {

  CenterPage();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Text('Hello', textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}
