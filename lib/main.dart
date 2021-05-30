import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'UserPageScreen.dart';
import 'UserFreindsListScreen.dart';
import 'screen/AuthenticationScreen.dart';
import 'widgets/WaitingWidget.dart';

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
      home: LandingPage(),
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

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
                body: Center(
              child: Text("Error with firebase ${snapshot.error}"),
            ));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            print("In done");
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    User user = snapshot.data;
                    if (user == null) {
                      return AuthenticationScreen();
                    }
                    return AuthenticationScreen();
                  }
                  return WaitingWidget();
                });
          }

          return WaitingWidget();
        });
  }
}
