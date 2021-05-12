import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InitialHero extends StatefulWidget {
  @override
  _InitialHeroState createState() => _InitialHeroState();
}

class _InitialHeroState extends State<InitialHero> {
  @override
  Widget build(BuildContext context) {
    var link =
        "http://coonamor.com/wp-content/uploads/2019/06/Rock-Amsterdam2.jpg";

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              child: Hero(
                  tag: "image",
                  child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('images/goku.jpg'))),
              onTap: () => Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    HeroWidgetDetail(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return child;
                },
              )),
            ),
          )
        ],
      ),
    );
  }
}

class HeroWidgetDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Hero(
            tag: "image",
            child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/goku.jpg'))),
      ),
    );
  }
}
