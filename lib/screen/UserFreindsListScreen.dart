import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class UserFreindsListScreen extends StatefulWidget {
  static const routeName = '/user-friends-list';
  @override
  _UserFreindsListScreenState createState() => _UserFreindsListScreenState();
}

class _UserFreindsListScreenState extends State<UserFreindsListScreen> {
  final String imageUrl = "gs://bumperapp-9f0e6.appspot.com/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My friends"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // navigate to add friend screen (don't exist)
            },
          ),
        ],
      ),
      // backgroundColor: Theme.of(context).backgroundColor,
      backgroundColor: Colors.amber[100],
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc("000")
              .collection("friends")
              .snapshots(),
          builder: (
            BuildContext ctx,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                children: snapshot.data.docs.map((friend) {
                  return Center(
                    child: Card(
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      color: Colors.blue[50],
                      child: ListTile(
                        //tileColor: Colors.lightBlue,
                        leading: CircleAvatar(
                          // Image.network(FirebaseStorage.instance.ref().child("bless.png").getPath())
                          // Image.network("gs://bumperapp-9f0e6.appspot.com/")
                          // backgroundImage: NetworkImage("gs://bumperapp-9f0e6.appspot.com/" + "bless.png")),
                          backgroundImage: NetworkImage(
                              "https://www.gardendesign.com/pictures/images/675x529Max/site_3/helianthus-yellow-flower-pixabay_11863.jpg"),
                        ),
                        trailing: Text(
                          "status - dynamic color",
                          style: TextStyle(color: Colors.blue),
                        ),
                        title: Text(friend["name"]),
                        onTap: () {},
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          }),
    );
  }
}
