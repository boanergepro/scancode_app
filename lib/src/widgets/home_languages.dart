import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/widgets/item_list_languages.dart';

class HomeLanguages extends StatelessWidget {
  UserProvider userState;

  HomeLanguages({this.userState});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 8),
            width: size.width,
            child: Text(
              'Languages',
              style: TextStyle(
                fontFamily: 'BalooDa',
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
          //List Badges
          Container(
            height: size.height * 0.3,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GridView.count(
                  crossAxisCount: 4,
                  children:
                  List.generate(userState.user.languages.length, (index) {
                    return itemListLanguages(
                      context,
                      constraints,
                      userState,
                      index,
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
