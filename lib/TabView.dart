import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(title: Text('TabView'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'One',
              ),
              Tab(
                text: 'two',
              ),
              Tab(
                text: 'three',
              ),

            ],

          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.red,

            ),
            Container(
              color: Colors.green,

            ),

          ],

        ),
    ));
  }
}
