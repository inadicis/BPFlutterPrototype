import 'package:dps_exchange/exchangePage.dart';
import 'package:flutter/material.dart';
import './inventoryPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final responseJsonInventory1 = {
    'Shield': 10,
    'Sword': 2,
    'Bow': 3,
    'Arrow': 50,
  };
  final responseJsonInventory2 = {
    'Shield': 1,
    'Sword': 5,
    'Bow': 0,
    'Arrow': 150,
  };

  void _openExchangePage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ExchangePage(responseJsonInventory1, responseJsonInventory2)));
  }

  void _openInventoryPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => InventoryPage(responseJsonInventory1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(icon: Icon(Icons.inventory), onPressed: _openInventoryPage)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openExchangePage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
