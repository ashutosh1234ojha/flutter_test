import 'package:flutter/material.dart';
import 'package:udemy/drawer/CustomDrawer.dart';

class DrawerHomePage extends StatefulWidget {
  @override
  _DrawerHomePageState createState() => _DrawerHomePageState();
}

class _DrawerHomePageState extends State<DrawerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      drawer:   CustomDrawer(),
    );
  }
}
