import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/widgets/item_list_badges.dart';

class HomeBadges extends StatelessWidget {
  UserProvider userState;

  HomeBadges({ this.userState });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.15,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 8),
            width: size.width,
            child: Text(
              'Overview',
              style: TextStyle(
                fontFamily: 'BalooDa',
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
          //List Badges
          Container(
            height: size.height * 0.1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: userState.user.badges.length,
                    itemBuilder: (context, index) {
                      return itemListBadges(constraints, userState, index);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
