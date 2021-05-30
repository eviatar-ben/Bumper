import 'package:flutter/material.dart';

import './UserPageScreen.dart';
import './UserFreindsListScreen.dart';

class AuthenticationScreen extends StatefulWidget {
  static const routeName = '/auth';
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen (Liron's)"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            MaterialButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(UserPageScreen.routeName),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              child: Text("go to user page screen (Ori's)"),
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(),
            ),
            Text("temporary button - helps developing"),
            //////////////////////////
            SizedBox(height: 150),
            //////////////////////////
            MaterialButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed(UserFreindsListScreen.routeName),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              child: Text("go to user friends list screen (Tadassa's)"),
              padding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(),
            ),
            Text("temporary button - helps developing"),
          ],
        ),
      ),
    );
  }
}
