import 'package:flutter/material.dart';

class UserPageScreen extends StatefulWidget {
  static const routeName = '/user-page';
  @override
  _UserPageScreenState createState() => _UserPageScreenState();
}

class _UserPageScreenState extends State<UserPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User page Screen (Ori's)"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
