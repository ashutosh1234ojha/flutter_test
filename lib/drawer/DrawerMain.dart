import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy/drawer/CustomDrawer.dart';



class DrawerMain extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _DrawerMainState createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        centerTitle: true,
        shadowColor: Colors.red,
      ),
      drawer: CustomDrawer(),
    ));
  }
}
