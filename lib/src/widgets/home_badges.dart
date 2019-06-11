import 'package:flutter/material.dart';
import 'package:scancode_app/src/providers/user.dart';
import 'package:scancode_app/src/widgets/item_list_badges.dart';

Widget homeBadges(UserProvider userState) {
  return Column(
    children: <Widget>[
      Flexible(
        flex: 2,
        child: Row(
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 15,
              child: Text(
                'Overview',
                style: TextStyle(
                  fontFamily: 'BalooDa',
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
            Spacer(
              flex: 20,
            )
          ],
        ),
      ),
      //List Badges
      Expanded(
        flex: 6,
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
      ),
      Divider(),
    ],
  );
}