import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  String selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text('$selected'),
            RaisedButton(
              onPressed: () {
                defaultDialog(context).then((value) => print(value));
              },
              child: Text('Default'),
            ),
            RaisedButton(
              onPressed: () {
                customDialog(context).then((value) => print(value));
              },
              child: Text('Custom'),
            )
          ],
        ),
      ),
    );
  }

  Future<String> defaultDialog(BuildContext context) {
    // ignore: missing_return
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Default dialog'),
            content: Text(
                'A common thread that runs along the Northeast States is lack of coordination amongst various agencies. The policy disconnect is further accentuated by the feeling that affairs of the North East Region (NER) are being run from Delhi. Most of the Central Armed Police Forces (CAPF) and Central agencies are headquartered in Delhi.'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop('Ok');
                  },
                  child: Text('Ok')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop('Cancel');
                  },
                  child: Text('Cancel'))
            ],
          );
        });
  }

  Future<String> customDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Are you sure you want to logout ?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: OutlineButton(
                            borderSide: BorderSide(color: Colors.grey),
                            onPressed: () {
                              Navigator.of(context).pop('Cancel');
                            },
                            child: Text('OK',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),

                          child: OutlineButton(
                              borderSide: BorderSide(color: Colors.grey),

                              onPressed: () {
                                Navigator.of(context).pop('CANCEL');
                              },
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
