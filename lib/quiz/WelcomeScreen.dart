import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg"),
          SafeArea(child: Column(
            children: [
              Text('Let\'s play quiz', style: Theme.of(context).textTheme.headline4.copyWith(
                color: Colors.white,fontWeight: FontWeight.bold
              ),)
            ],

          ))
        ],
      ),
    );
  }
}

