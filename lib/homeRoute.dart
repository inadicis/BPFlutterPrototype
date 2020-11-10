import 'package:dps_exchange/exchangePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './inventoryPage.dart';
import './centerPage.dart';
import 'qrCodePage.dart';

class HomeRoute extends StatefulWidget {
  final String title;

  HomeRoute({Key key, this.title}) : super(key: key);

  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  PageController _pageController;
  int _currentPage = 1;

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

  final qrCodeData = 'www.dps.training';

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _openExchangePage() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ExchangePage(responseJsonInventory1, responseJsonInventory2)));
  }

  /* void _openInventoryPage() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => InventoryPage(responseJsonInventory1)));
  }*/

  void _swipeToPage(int pageIndex) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = pageIndex;
      });
    }
  }

  void _openHelpPage() {
    //TODO
  }

  void _updateIndex(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(icon: Icon(Icons.help), onPressed: _openHelpPage)],
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: _updateIndex,
            controller: _pageController,
            children: [
              QRCodePage(qrCodeData),
              CenterPage(),
              InventoryPage(responseJsonInventory1)
            ],
          ),
          Positioned(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black12,),
              onPressed: () {
                if (_pageController.hasClients) {
                  _pageController.animateToPage(
                    _currentPage - 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
            bottom: 300,
            left: 5,
          ),
          Positioned(
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.black12),
              onPressed: () {
                if (_pageController.hasClients) {
                  _pageController.animateToPage(
                    _currentPage + 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
            bottom: 300,
            right: 5,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openExchangePage,
        tooltip: 'Open items exchange page',
        child: Icon(Icons.compare_arrows),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: _swipeToPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), label: 'Scanner'),
          BottomNavigationBarItem(
              icon: Icon(Icons.backpack), label: 'Inventory'),
        ],
      ),
    );
  }
}
