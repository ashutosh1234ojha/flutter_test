import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil extends StatefulWidget {
  @override
  _PermissionUtilState createState() => _PermissionUtilState();
}

class _PermissionUtilState extends State<PermissionUtil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission'),
      ),
      body: Builder(builder: (context) {
        return ListView(
          children: [
            FlatButton(
              onPressed: () {
                checkLocationPermission(context);
              },
              child: Text('Location'),
              color: Colors.grey,
            ),
          ],
        );
      }),
    );
  }

  void checkLocationPermission(BuildContext context) async {
    //  bool isShown = await Permission.contacts.shouldShowRequestRationale;
    var status = await Permission.location.status;
    if (status.isGranted) {
      showSnackBarCustom('Granted', context);
    } else if (status.isUndetermined || status.isDenied) {
      await Permission.location.request();
      var status = await Permission.location.status;

      if (status.isGranted) {
        showSnackBarCustom('Granted', context);
      } else {
        showSnackBarCustom('Denied', context);
      }
    } else if (status.isPermanentlyDenied || status.isRestricted) {
      showSnackBarCustom('PermanentlyDenied', context);
      openAppSettings();
    }
    bool isShown = await Permission.contacts.shouldShowRequestRationale;

    print('Request_rationale $isShown');
  }

  void showSnackBarCustom(String msg, BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Colors.redAccent,
    ));
  }
}
