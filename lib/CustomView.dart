import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomView extends StatefulWidget {
  @override
  _CustomViewState createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.purpleAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              color: Colors.red,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: () {
                        print('hello');
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.yellow,
                      )),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  )
                ],
              ),
            ),
            Container(
              width: 100,
              color: Colors.blue,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            )
          ],
        ),
      ),
    );
  }
}
