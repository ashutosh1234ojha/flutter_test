import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImage extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyImage> {
  String selected = "";
  File cameraImageFile=new File('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text('$selected'),
            Container(
                height: 300,
                width: 300,
                child: Center(child: Image.file(cameraImageFile))),
            RaisedButton(
              onPressed: () {
                getImageFromCamera(true);
              },
              child: Text('Camera'),
            ),
            RaisedButton(
              onPressed: () {
                getImageFromCamera(false);

              },
              child: Text('Gallery'),
            )
          ],
        ),
      ),
    );
  }

  void getImageFromCamera(bool isCamera) async {
    var file;
    if(isCamera)
    {
      file = await ImagePicker().getImage(source: ImageSource.camera);
    }else{
      file = await ImagePicker().getImage(source: ImageSource.gallery);

    }

      setState(() {
        cameraImageFile = File(file.path);
        if (cameraImageFile == null) {
          selected = 'Image not selected';
        }else{
          print("Image path "+file.path);
        }

      });
    }
  }

