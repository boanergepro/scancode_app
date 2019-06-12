import 'package:flutter/material.dart';
import 'package:scancode_app/src/widgets/drawer.dart';

class ProjectsScreen extends StatelessWidget {
  static final routerName = '/top-projects';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top projects',
          style: TextStyle(
            fontFamily: 'BalooDa',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      drawer: drawer(context),
    );
  }
}
