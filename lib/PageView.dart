import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  PageController pageController=PageController(initialPage: 0);
  int  pageNumber=0;
  int page=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RaisedButton(onPressed: (){
        setState(() {
          if(page>=2){
            page=page-1;
          }
          page=page+1;
          pageController.animateToPage(page, duration: Duration(microseconds: 250), curve: Curves.bounceInOut);
        });
      },),
      appBar: AppBar(title: Text('ViewPager')),
      body: PageView(
        onPageChanged: (index){
          setState(() {
            pageNumber=index;
          });
        },
        controller: pageController,
        children: [
          Container(
            color: Colors.green,
            child: Center(child: Text('MY page number ${pageNumber+1}')),
          ),
          Container(
            color: Colors.red,
            child: Center(child: Text('MY page number ${pageNumber+1}')),

          ),
          Container(
            color: Colors.yellow,
            child: Center(child: Text('MY page number ${pageNumber+1}')),

          )
        ],
    ),
    );
  }
}
