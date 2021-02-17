import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy/drawer/CustomDrawer.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page two'),
      ),
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.purpleAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              color: Colors.green,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
          ],
        ),
      ),
    );
  }
}
