import 'package:flutter/material.dart';
import 'package:udemy/BottomNavigation.dart';
import 'package:udemy/drawer/CustomDrawer.dart';

import 'CustomView.dart';
import 'MyInputText.dart';
import 'PageView.dart';
import 'my_bloc/MyBlocPatter.dart';
import 'tab_view/TabView.dart';
import 'CustomView.dart';
import 'drawer/DrawerMain.dart';
import 'MyDialog.dart';
import 'MyImage.dart';
import 'PermissionUtil.dart';
import 'BottomSlidingView.dart';
import 'Async.dart';
import 'AppCustomWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget createButton(
      BuildContext context, Color color, String string, StatefulWidget widget) {
    return Container(
      width: double.infinity,
      color: color,
      child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget),
            );
          },
          child: Text(string)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select feature'),
        centerTitle: true,
        shadowColor: Colors.red,
      ),
      body: ListView(
        children: [
          createButton(context, Colors.yellow, 'Bottom navigation view',
              BottomNavigation()),
          createButton(context, Colors.green, 'Input text', MyInputText()),
          createButton(context, Colors.yellow, 'PageView', MyPageView()),
          createButton(context, Colors.green, 'TabView', TabView()),
          createButton(context, Colors.yellow, 'CustomDrawer', DrawerMain()),
          createButton(context, Colors.green, 'View', CustomView()),
          createButton(context, Colors.yellow, 'MyDialog', MyDialog()),
          createButton(context, Colors.green, 'Image', MyImage()),
          createButton(context, Colors.yellow, 'Permission', PermissionUtil()),
          createButton(context, Colors.green, 'Async', Async()),
          createButton(
              context, Colors.yellow, 'BottomSlidingView', BottomSlidingView()),
          createButton(
              context, Colors.green, 'AppCustomWidget', AppCustomWidget()),
          createButton(context, Colors.yellow, 'Bloc', MyBlocPatter()),
        ],
      ),
    );
  }
}
