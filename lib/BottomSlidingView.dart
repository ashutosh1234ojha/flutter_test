import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BottomSlidingView extends StatefulWidget {
  @override
  _BottomSlidingViewState createState() => _BottomSlidingViewState();
}

class _BottomSlidingViewState extends State<BottomSlidingView> {
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BottomSlidingView'),
        ),
        body: SlidingUpPanel(
          borderRadius: radius,
          backdropEnabled: true,
          collapsed: Container(
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius:radius
            ),
           child:   Expanded(
             flex: 1,
             child: Center(
               child: Text(
                 "This is the collapsed Widget",
                 style: TextStyle(color: Colors.white),
               ),
             ),
           )
          ),
          panel: Center(
          child: Container(
            child: Column(
              children: [
                Text("Pull this widget"),
                Container(
                  height: 50,
                  color: Colors.green,
                ),
                Container(
                  height: 50,
                  color: Colors.yellow,
                )
              ],
            ),
          ),
          ),
          body: Center(
            child: Text("This is the Widget behind the sliding panel"),
          ),
        ),
    );
  }
}
