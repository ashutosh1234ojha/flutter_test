import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PageOne.dart';
import 'PageTwo.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      Container(
        height: 200,
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/goku.jpg'),
          ),
        ),
      ),
      ListTile(
        title: Text('Item 1'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageOne()),
          );
        },
      ),
      Divider(
        height: 5,
        color: Colors.grey,
      ),
      ListTile(
        title: Text('Item 2'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageTwo()),
          );
        },
      ),
      Divider(
        height: 5,
        color: Colors.grey,
      ),
      ListTile(
        title: Text('Item 3'),
        onTap: () {
          // Update the state of the app.
          // ...
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              "Hello world",
            ),
            backgroundColor: Colors.redAccent,
          ));
        },
      ),
    ]));
  }
}
