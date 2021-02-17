import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  getColours(int index) {
    switch (index) {
      case 0:
        return Colors.red;
        break;
      case 1:
        return Colors.green;

        break;
      case 2:
        return Colors.yellow;

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom navigation view'),
      ),
      body: Container(
        color: getColours(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings')
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
