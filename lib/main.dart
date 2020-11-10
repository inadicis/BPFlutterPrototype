import 'package:dps_exchange/homeRoute.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeData lightTheme = ThemeData.light();
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[800],
    accentColor: Colors.lightBlue[200],
    primaryColorLight: Colors.white,
    highlightColor: Colors.white60,

    // fontFamily: 'Georgia',

    textTheme: TextTheme(
      // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      home: HomeRoute(
        title: 'DPS Prototype',
      ),
    );
  }
}
