import 'package:flutter/material.dart';
import 'package:scancode_app/src/models/user.dart';

class HomeScreen extends StatefulWidget {
  User currentUser;
  HomeScreen({this.currentUser});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.network(widget.currentUser.avatarUrl),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Center(child: Text(widget.currentUser.name),),
            ),
          )
        ],
      )
    );
  }
}
