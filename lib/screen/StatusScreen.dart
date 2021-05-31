import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toggle_switch/toggle_switch.dart';

class StatusScreen extends StatefulWidget {
  static const routeName = '/status';
  @override
  _StatusScreen createState() => _StatusScreen();
}

class _StatusScreen extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerLeft,
            child: ToggleSwitch(
              initialLabelIndex: 0,
              labels: ['On', 'Off'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          ),
          // This two lines change the status bar color
          backwardsCompatibility: false,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Color(0xffffe061)),
          centerTitle: true,
          // title: Text('title'),
          actions: [
            Icon(Icons.settings),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ],
          backgroundColor: Color(0xffa3cb73),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton(child: Text("My Friends"), onPressed: null),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 7.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 70,
                        child: ClipOval(
                            // this line should take image from firebase :
                            // child: FirebaseImage('gs://bucket123/userIcon123.jpg')),
                            //based upon this article https://pub.dev/packages/firebase_image
                            child: Image.asset(
                          'images/profile_3.png',
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )),
                      )),
                ],
              ),
            ),
            // Text("test"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(child: Text("status1"), onPressed: null),
                ElevatedButton(child: Text("status2"), onPressed: null),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(child: Text("status3"), onPressed: null),
                ElevatedButton(child: Text("status4"), onPressed: null),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
