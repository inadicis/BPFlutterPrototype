import 'package:flutter/material.dart';

class CenterPage extends StatelessWidget {
  PageController _pageController;

  CenterPage(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              if (_pageController.hasClients) {
                _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: Text('Hello', textAlign: TextAlign.center,),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              if (_pageController.hasClients) {
                _pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ),
      ],

      /*Container(
        color: Colors.white,
        child: CenterPage(),

        Center(
          child: ElevatedButton(
            onPressed: () {
              if (_pageController.hasClients) {
                _pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Text('Next'),
          ),
        ),
      ),*/
    );
  }
}
