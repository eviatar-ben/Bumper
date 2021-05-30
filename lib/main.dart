import 'package:flutter/material.dart';

import './AuthenticationScreen.dart';
import './UserPageScreen.dart';
import './UserFreindsListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bla bla',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.amber[100]),
      home: AuthenticationScreen(),
      routes: {
        // using 'routs' we bind between the route(name) to the class
        // to easly move to the other class(screen)
        AuthenticationScreen.routeName: (ctx) => AuthenticationScreen(),
        UserPageScreen.routeName: (ctx) => UserPageScreen(),
        UserFreindsListScreen.routeName: (ctx) => UserFreindsListScreen(),
      },
    );
  }
}
