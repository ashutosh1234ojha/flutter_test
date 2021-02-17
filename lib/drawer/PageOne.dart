import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page one'),
      ),
      body: Container(
        color: Colors.purpleAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              color: Colors.red,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
          ],
        ),
      ),
    );
  }
}
