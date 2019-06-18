import 'package:flutter/material.dart';
import 'package:scancode_app/src/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/widgets/item_repositories.dart';

class ProjectsScreen extends StatelessWidget {
  static final routerName = '/top-projects';

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserProvider>(context);

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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: userState.user.repositories.length,
          itemBuilder: (context, index) {
            return itemRepositories(context, userState, index);
          },
        ),
      ),
    );
  }
}
