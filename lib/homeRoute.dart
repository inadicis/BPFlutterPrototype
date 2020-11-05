import 'package:dps_exchange/exchangePage.dart';
import 'package:flutter/material.dart';
import './inventoryPage.dart';

class HomeRoute extends StatefulWidget {
  final String title;

  HomeRoute({Key key, this.title}) : super(key: key);

  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ExchangePage(responseJsonInventory1, responseJsonInventory2)));
  }

  void _openInventoryPage() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => InventoryPage(responseJsonInventory1)));
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
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text('Next'),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blue),
                ),
                onPressed: () {
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text('Previous'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openExchangePage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
