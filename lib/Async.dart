import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Async extends StatefulWidget {
  @override
  _AsyncState createState() => _AsyncState();
}

class _AsyncState extends State<Async> {
// var timer= new Timer.periodic(Duration(seconds: 15), (Timer t) => print('hi!'));
  //var timer= new Timer.periodic(Duration(seconds: 15), (Timer t) => getDataPeriodically());

  void checkForNewSharedLists() {
    // do request here
    setState(() {
      // change state according to result of request
    });
  }

  var response = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async'),
      ),
      body: Column(
        children: [
          FlatButton(
              onPressed: () {
                handleFuture();
              },
              child: Text('Callbacks')),
          FlatButton(
              onPressed: () {
                handleAwait();
              },
              child: Text('Await')),
          FlatButton(
              onPressed: () {
                //  getDataSerially();
                getDataParallelly();
              },
              child: Text('Concurrency')),
          FlatButton(
              onPressed: () {
                //  getDataSerially();
                getDataPeriodically();
              },
              child: Text('Periodic')),
        ],
      ),
    );
  }

  Future<String> getFutureString() {
    Future<String> future = Future.delayed(Duration(seconds: 5), () {
      return 'this will be returned after 5 sec';
    });

    return future;
  }

  void handleFuture() {
    //1st method
    // print('handle future started');
    // Future<String> futureString = getFutureString();
    // futureString
    //     .then((value) => {print('handle future ends with  $value')})
    //     .catchError(() {});

    //2nd method

    print('handle future started');
    Future<String> futureString = getFutureString();
    futureString
        .then((value) => {print('handle future ends with  $value')})
        .catchError((error) => {})
        .whenComplete(() => {print('whenComplete')});

    //3rd method

    // Future.delayed(Duration(seconds: 5))
    //     .then((value) => {})
    //     .catchError(() {})
    //     .whenComplete(() => {});
  }

  void handleAwait() async {
    print('handle future started');

    String value = await Future.delayed(Duration(seconds: 5), () {
      return 'this will be returned after 5 sec';
    });

    try {
      print('handle future ends with  $value');
    } catch (e) {
      print('Error');
    }
  }

  void getDataSerially() async {
    var url = 'https://jsonplaceholder.typicode.com';
    var post = await http.get(url + '/posts/1');
    var comment = await http.get(url + '/comments?/postId=1');

    print('post=' + post.body);
    print('comment=' + comment.body);
  }

  void getDataParallelly() async {
    var url = 'https://jsonplaceholder.typicode.com';

    final results = await Future.wait(
        [http.get(url + '/posts/1'), http.get(url + '/comments?/postId=1')]);

    print('post=' + results[0].body);
    print('comment=' + results[1].body);
  }

  Future<String> getDataPeriodically() async {
    var url = 'https://jsonplaceholder.typicode.com';
    int counter = 0;

    Timer.periodic(Duration(seconds: 10), (timer) async {
      var post = await http.get(url + '/posts/1');
      print('post= ${++counter}' + post.body);
    });
  }
}
